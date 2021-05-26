import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getDeviceInfo() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Map<String, dynamic> deviceData;

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      deviceData = {
        'udid': build.id,
        'model': build.model,
        'os_platform': 'Android',
        'os_version': build.version.release,
      };
    } else if (Platform.isIOS) {
      IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      deviceData = {
        'udid': data.identifierForVendor,
        'model': data.model,
        'os_platform': data.systemName,
        'os_version': data.systemVersion,
      };
    }
  } on PlatformException {
    deviceData = <String, dynamic>{
      'Errors:': 'Failed to get platform version',
    };
  }

  return deviceData;
}
