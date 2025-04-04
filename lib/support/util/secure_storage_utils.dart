import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

const seoul_location_latitude = 37.5665;
const seoul_location_longitude = 126.9780;

class SecureStorageUtils {
  SecureStorageUtils._internal();

  static final SecureStorageUtils _instance = SecureStorageUtils._internal();

  static SecureStorageUtils get instance => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveLocation(double lat, double lng) async {
    await _storage.write(key: 'latitude', value: lat.toString());
    await _storage.write(key: 'longitude', value: lng.toString());
  }

  Future<(double, double)> getLocation() async {
    String? latStr = await _storage.read(key: 'latitude');
    String? lngStr = await _storage.read(key: 'longitude');

    if (latStr != null && lngStr != null) {
      return (double.parse(latStr), double.parse(lngStr));
    } else {
      var status = await Permission.location.request();

      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(),
        );

        saveLocation(position.latitude, position.longitude);
        return (position.latitude, position.longitude);
      } else if (status.isDenied) {
        return (seoul_location_latitude, seoul_location_longitude);
      } else if (status.isPermanentlyDenied) {
        saveLocation(seoul_location_latitude, seoul_location_longitude);

        return (seoul_location_latitude, seoul_location_longitude);
      } else {
        return (seoul_location_latitude, seoul_location_longitude);
      }
    }
  }

  Future<void> clearLocation() async {
    await _storage.delete(key: 'latitude');
    await _storage.delete(key: 'longitude');
  }
}
