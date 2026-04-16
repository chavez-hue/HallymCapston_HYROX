import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../core/utils/shape_similarity.dart';
import '../../domain/entities/gps_point.dart';
import '../bloc/running_bloc.dart';
import '../bloc/running_state.dart';

class GpsMapView extends StatefulWidget {
  final String? mode;
  final String? shapeLabel;

  const GpsMapView({super.key, this.mode, this.shapeLabel});

  @override
  State<GpsMapView> createState() => _GpsMapViewState();
}

class _GpsMapViewState extends State<GpsMapView> {
  GoogleMapController? _controller;

  /// 도형 오버레이 기준 중심점 (최초 GPS 포인트 또는 현재 위치로 고정)
  LatLng? _refCenter;

  static const _defaultPosition = CameraPosition(
    target: LatLng(37.5665, 126.9780), // 서울 기본값
    zoom: 16,
  );

  List<GpsPoint> _routeFromState(RunningState state) => switch (state) {
        RunningActive s => s.route,
        RunningPaused s => s.route,
        RunningFinished s => s.record.route,
        _ => const [],
      };

  void _moveCameraToLatest(List<GpsPoint> route) {
    if (route.isEmpty || _controller == null) return;
    final last = route.last;
    _controller!.animateCamera(
      CameraUpdate.newLatLng(LatLng(last.latitude, last.longitude)),
    );
  }

  Future<void> _moveToCurrentLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) return;

    try {
      final pos = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high),
      );
      final latLng = LatLng(pos.latitude, pos.longitude);
      _controller?.animateCamera(CameraUpdate.newLatLng(latLng));

      // 아직 기준점이 없으면 현재 위치를 기준점으로 설정
      if (_refCenter == null && mounted) {
        setState(() => _refCenter = latLng);
      }
    } catch (_) {
      // 위치 조회 실패 시 기본 위치 유지
    }
  }

  /// 랜덤 모드일 때 목표 도형을 GPS 좌표로 변환해 반투명 Polyline으로 반환.
  ///
  /// 템플릿은 [0,1]² 정규화 공간에서 반지름 0.4로 중심(0.5, 0.5)에 위치.
  /// 약 0.008도(≈ 890m) 스팬으로 실제 위경도에 투영.
  Set<Polyline> _buildShapeOverlay() {
    if (widget.mode != 'random' ||
        widget.shapeLabel == null ||
        _refCenter == null) {
      return {};
    }

    final template =
        ShapeSimilarityCalculator.templateFor(widget.shapeLabel!);
    if (template.isEmpty) return {};

    // 위도 1도 ≈ 111km, 경도 1도 ≈ 111km × cos(lat)
    const double latSpanDeg = 0.008; // ≈ 890m 세로 span
    final clat = _refCenter!.latitude;
    final clon = _refCenter!.longitude;
    final lonSpanDeg = latSpanDeg / cos(clat * pi / 180.0);

    // 템플릿 [0,1]² → LatLng 변환
    // dy: 0 = 위(북), 1 = 아래(남)  →  lat = center + (0.5 - dy) * span
    // dx: 0 = 왼(서), 1 = 오른(동)  →  lon = center + (dx - 0.5) * span
    final points = template
        .map((p) => LatLng(
              clat + (0.5 - p.dy) * latSpanDeg,
              clon + (p.dx - 0.5) * lonSpanDeg,
            ))
        .toList();

    return {
      Polyline(
        polylineId: const PolylineId('shape_overlay'),
        points: [...points, points.first], // 닫힌 경로
        color: AppColors.primaryOrange.withValues(alpha: 0.3),
        width: 3,
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
      ),
    };
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RunningBloc, RunningState>(
      listenWhen: (prev, curr) {
        final prevRoute = _routeFromState(prev);
        final currRoute = _routeFromState(curr);
        return currRoute.length != prevRoute.length;
      },
      listener: (context, state) {
        final route = _routeFromState(state);
        // 첫 GPS 포인트 도착 시 기준점 고정 (이후 이동해도 오버레이는 고정)
        if (route.isNotEmpty && _refCenter == null) {
          setState(() => _refCenter =
              LatLng(route.first.latitude, route.first.longitude));
        }
        _moveCameraToLatest(route);
      },
      builder: (context, state) {
        final route = _routeFromState(state);

        final routePolyline = route.length >= 2
            ? {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: route
                      .map((p) => LatLng(p.latitude, p.longitude))
                      .toList(),
                  color: AppColors.primaryOrange,
                  width: 5,
                  jointType: JointType.round,
                  startCap: Cap.roundCap,
                  endCap: Cap.roundCap,
                ),
              }
            : <Polyline>{};

        return GoogleMap(
          initialCameraPosition: _defaultPosition,
          onMapCreated: (controller) {
            _controller = controller;
            final r = _routeFromState(state);
            if (r.isNotEmpty) {
              _moveCameraToLatest(r);
            } else {
              _moveToCurrentLocation();
            }
          },
          polylines: {
            ...routePolyline,
            ..._buildShapeOverlay(),
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          mapType: MapType.normal,
        );
      },
    );
  }
}
