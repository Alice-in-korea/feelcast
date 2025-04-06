import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter/material.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final SecureStorageUtils storage;

  LocationCubit(this.storage) : super(LocationState.init());

  Future<void> initStorage() async {
    final (lat, lng) = await storage.getLocation();

    emit(LocationState(latitude: lat, longitude: lng));
  }

  /// background상태에서 resume될 때 위치 정보 가져오기
  /// 유효 여부 확인 후 위치 정보 emit
  AppLifecycleListener init() {
    return AppLifecycleListener(
      onResume: () async => await initStorage(),
      onStateChange: _handleStateChange,
    );
  }

  Future<void> _handleStateChange(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) LogHelper.logInfo('$state');
  }
}
