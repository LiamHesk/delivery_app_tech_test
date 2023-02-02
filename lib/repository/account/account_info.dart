import 'package:delivery_app_tech_test/repository/device/device_os_enum.dart';

class AccountInfo {
  final String email;
  final String password;
  final String? deviceName;
  final String? deviceToken;
  final DeviceOS? deviceOS;
  final List<String>? deviceDetails;

  AccountInfo({
    required this.email,
    required this.password,
    this.deviceName,
    this.deviceToken,
    this.deviceOS,
    this.deviceDetails,
  });
}
