import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

const seoulLatitude = 37.5665;
const seoulLongitude = 126.9780;

class SecureStorageUtils {
  SecureStorageUtils._internal();

  static final SecureStorageUtils _instance = SecureStorageUtils._internal();

  static SecureStorageUtils get instance => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<(double, double)> getLocation() async {
    String? latStr = await _storage.read(key: 'latitude');
    String? lngStr = await _storage.read(key: 'longitude');

    String? expiryStr = await _storage.read(key: 'locationExpiryTime');

    if (expiryStr != null) {
      final expiry = DateTime.tryParse(expiryStr);

      if (expiry == null || DateTime.now().isAfter(expiry)) {
        _clearLocation();
      }
    }

    if (latStr != null && lngStr != null) {
      return (double.parse(latStr), double.parse(lngStr));
    } else {
      var status = await Permission.location.request();

      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(),
        );

        _saveLocation(position.latitude, position.longitude);
        return (position.latitude, position.longitude);
      } else if (status.isDenied) {
        return (seoulLatitude, seoulLongitude);
      } else if (status.isPermanentlyDenied) {
        _saveLocation(seoulLatitude, seoulLongitude);

        return (seoulLatitude, seoulLongitude);
      } else {
        return (seoulLatitude, seoulLongitude);
      }
    }
  }

  Future<void> _saveLocation(double lat, double lng) async {
    const Duration validLocationHour = Duration(hours: 1);
    final expiryTime = DateTime.now().add(validLocationHour);

    await _storage.write(key: 'latitude', value: lat.toString());
    await _storage.write(key: 'longitude', value: lng.toString());
    await _storage.write(
      key: 'locationExpiryTime',
      value: expiryTime.toString(),
    );
  }

  Future<void> _clearLocation() async {
    await _storage.delete(key: 'latitude');
    await _storage.delete(key: 'longitude');
    await _storage.delete(key: 'locationExpiryTime');
  }
}
