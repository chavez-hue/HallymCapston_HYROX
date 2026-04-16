import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/running/running_bottom_panel.dart';
import 'run_pause_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async'; // 실시간 위치 추적을 위한 타이머/스트림용

class RunStartScreen extends StatefulWidget {
  const RunStartScreen({super.key});

  @override
  State<RunStartScreen> createState() => _RunStartScreenState();
}

class _RunStartScreenState extends State<RunStartScreen> {
  late GoogleMapController mapController;
  static const LatLng _hallymUniv = LatLng(37.881, 127.730);

  // 경로 그리기용 변수
  List<LatLng> _routePoints = []; // 1. 내가 지나온 좌표
  StreamSubscription<Position>? _positionStream; // 2. 위치 변화
  // ------------------------------

  @override
  void initState() {
    super.initState();
    _startTracking(); // 앱 켜지자마자 위치 추적
  }

  // 실시간 위치를 감시하고 좌표를 수집하는 함수
  void _startTracking() {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5, // 5미터 움직일 때마다 업데이트
      ),
    ).listen((Position position) {
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);

      if (mounted) {
        setState(() {
          _routePoints.add(currentLatLng); // 새 좌표 추가
        });
      }

      // 내 위치에 맞춰 지도 화면 이동 (선택 사항)
      mapController.animateCamera(CameraUpdate.newLatLng(currentLatLng));
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel(); // 화면 나가면 추적 중지 (배터리 절약)
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _handlePause(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RunPauseScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: _hallymUniv,
                    zoom: 16.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  // 지도 위에 선 그리기 설정 추가
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId('my_route'),
                      points: _routePoints, // 주머니에 담긴 좌표들 연결
                      color: Colors.blue, // 선 색깔
                      width: 5, // 선 두께
                    ),
                  },
                  // ------------------------------------
                ),
              ),
              Expanded(
                flex: 4,
                child: RunningBottomPanel(
                  onPause: () => _handlePause(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}