import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants/app_colors.dart';
import '../../features/running/domain/entities/gps_point.dart';

class RouteReplayScreen extends StatefulWidget {
  final List<GpsPoint> route;

  const RouteReplayScreen({super.key, required this.route});

  @override
  State<RouteReplayScreen> createState() => _RouteReplayScreenState();
}

class _RouteReplayScreenState extends State<RouteReplayScreen> {
  GoogleMapController? _controller;

  static const _defaultPosition = CameraPosition(
    target: LatLng(37.5665, 126.9780),
    zoom: 16,
  );

  List<LatLng> get _latLngs =>
      widget.route.map((p) => LatLng(p.latitude, p.longitude)).toList();

  /// 경로 전체가 보이도록 카메라 경계를 맞춘다.
  Future<void> _fitBounds() async {
    if (_controller == null || widget.route.isEmpty) return;

    final points = _latLngs;

    if (points.length == 1) {
      await _controller!.animateCamera(
        CameraUpdate.newLatLngZoom(points.first, 17),
      );
      return;
    }

    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (final p in points) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    await _controller!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        ),
        72, // padding (px)
      ),
    );
  }

  Set<Polyline> get _polylines {
    final points = _latLngs;
    if (points.length < 2) return {};
    return {
      Polyline(
        polylineId: const PolylineId('replay_route'),
        points: points,
        color: AppColors.primaryOrange,
        width: 5,
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
      ),
    };
  }

  Set<Marker> get _markers {
    final points = _latLngs;
    if (points.isEmpty) return {};

    return {
      Marker(
        markerId: const MarkerId('start'),
        position: points.first,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: '출발'),
      ),
      if (points.length > 1)
        Marker(
          markerId: const MarkerId('end'),
          position: points.last,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange),
          infoWindow: const InfoWindow(title: '도착'),
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
    final isEmpty = widget.route.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '경로 보기',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: isEmpty
          ? const Center(
              child: Text(
                'GPS 경로 데이터가 없습니다.',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
              ),
            )
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: _defaultPosition,
                  onMapCreated: (controller) {
                    _controller = controller;
                    // 지도 렌더링 완료 후 bounds 맞춤
                    Future.delayed(const Duration(milliseconds: 300),
                        _fitBounds);
                  },
                  polylines: _polylines,
                  markers: _markers,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: true,
                  mapToolbarEnabled: false,
                  mapType: MapType.normal,
                ),
                // 범례
                Positioned(
                  bottom: 24,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _LegendDot(color: Colors.green.shade600),
                        const SizedBox(width: 6),
                        const Text('출발',
                            style: TextStyle(
                                color: AppColors.white, fontSize: 13)),
                        const SizedBox(width: 16),
                        _LegendDot(color: AppColors.primaryOrange),
                        const SizedBox(width: 6),
                        const Text('도착',
                            style: TextStyle(
                                color: AppColors.white, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  const _LegendDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
