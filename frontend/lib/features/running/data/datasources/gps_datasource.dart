import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/gps_point.dart';

abstract interface class GpsDataSource {
  Stream<GpsPoint> watchPosition();
}

@LazySingleton(as: GpsDataSource)
class GpsDataSourceImpl implements GpsDataSource {
  @override
  Stream<GpsPoint> watchPosition() => _positionStream();

  Stream<GpsPoint> _positionStream() async* {
    // 권한은 UI 레이어(LocationPermissionHelper)에서 사전에 요청됨.
    // 여기서는 최종 상태만 확인하고 미허용이면 명확한 에러를 던진다.
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception('위치 권한이 영구 거부되었습니다. 설정 앱에서 권한을 허용해주세요.');
    }
    if (permission == LocationPermission.denied) {
      throw Exception('위치 권한이 필요합니다.');
    }

    const settings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5, // 5m 이상 이동 시 업데이트
    );

    yield* Geolocator.getPositionStream(locationSettings: settings).map(
      (pos) => GpsPoint(
        latitude: pos.latitude,
        longitude: pos.longitude,
        timestamp: pos.timestamp,
        altitude: pos.altitude,
        accuracy: pos.accuracy,
      ),
    );
  }
}
