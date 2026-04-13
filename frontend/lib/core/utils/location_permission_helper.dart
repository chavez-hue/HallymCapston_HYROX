import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// 위치 권한 요청 유틸리티.
///
/// UI 레이어에서 호출해 권한 상태를 확인하고 팝업을 표시한다.
/// - [request]: BuildContext 있는 경우 (영구 거부 시 설정 다이얼로그 표시)
/// - [requestOnStartup]: 앱 시작 시 BuildContext 없는 경우
class LocationPermissionHelper {
  LocationPermissionHelper._();

  /// 현재 위치 권한이 허용된 상태인지 반환한다.
  static Future<bool> isGranted() =>
      Permission.locationWhenInUse.isGranted;

  /// 위치 권한을 요청하고 결과(허용 여부)를 반환한다.
  ///
  /// 권한 상태에 따른 동작:
  /// - 허용됨: 즉시 true 반환
  /// - 미결(첫 요청 / 이전에 거부): 시스템 팝업 표시 후 결과 반환
  /// - 영구 거부: 설정 이동 다이얼로그 표시 후 false 반환
  static Future<bool> request(BuildContext context) async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isGranted) return true;

    // 영구 거부 상태면 시스템 팝업 없이 설정으로 안내
    if (status.isPermanentlyDenied) {
      if (context.mounted) await _showSettingsDialog(context);
      return false;
    }

    // 시스템 권한 팝업 표시
    status = await Permission.locationWhenInUse.request();

    // 팝업에서 "다시 묻지 않음"을 선택한 경우
    if (status.isPermanentlyDenied && context.mounted) {
      await _showSettingsDialog(context);
    }

    return status.isGranted;
  }

  /// 앱 시작 시 권한을 선제 요청한다.
  ///
  /// BuildContext가 없으므로 영구 거부 시 설정 다이얼로그를 표시하지 않는다.
  /// 이미 허용됐거나 영구 거부된 경우 아무것도 하지 않는다.
  static Future<void> requestOnStartup() async {
    final status = await Permission.locationWhenInUse.status;
    if (!status.isGranted && !status.isPermanentlyDenied) {
      await Permission.locationWhenInUse.request();
    }
  }

  /// 영구 거부 상태일 때 설정 앱으로 이동하도록 안내하는 다이얼로그.
  static Future<void> _showSettingsDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('위치 권한 필요'),
        content: const Text(
          'GPS 러닝 기능을 사용하려면 위치 권한이 필요합니다.\n'
          '설정 앱에서 위치 권한을 "앱 사용 중에만 허용"으로 변경해주세요.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('설정 열기'),
          ),
        ],
      ),
    );
  }
}
