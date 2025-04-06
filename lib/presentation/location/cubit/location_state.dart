part of 'location_cubit.dart';

class LocationState extends Equatable {
  final double latitude;
  final double longitude;

  const LocationState({required this.latitude, required this.longitude});

  factory LocationState.init() =>
      LocationState(latitude: seoulLatitude, longitude: seoulLongitude);

  GridXY get xy => convertLatLonToGrid(latitude, longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}
