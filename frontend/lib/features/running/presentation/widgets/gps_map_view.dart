import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../constants/app_colors.dart';
import '../../domain/entities/gps_point.dart';
import '../bloc/running_bloc.dart';
import '../bloc/running_state.dart';

class GpsMapView extends StatefulWidget {
  const GpsMapView({super.key});

  @override
  State<GpsMapView> createState() => _GpsMapViewState();
}

class _GpsMapViewState extends State<GpsMapView> {
  GoogleMapController? _controller;

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

  /// 지도 초기화 시 현재 기기 위치로 카메라 이동
  Future<void> _moveToCurrentLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) return;

    try {
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      _controller?.animateCamera(
        CameraUpdate.newLatLng(LatLng(pos.latitude, pos.longitude)),
      );
    } catch (_) {
      // 위치 조회 실패 시 기본 위치 유지
    }
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
        _moveCameraToLatest(_routeFromState(state));
      },
      builder: (context, state) {
        final route = _routeFromState(state);

        final polylines = route.length >= 2
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
            final route = _routeFromState(state);
            if (route.isNotEmpty) {
              _moveCameraToLatest(route);
            } else {
              _moveToCurrentLocation();
            }
          },
          polylines: polylines,
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
