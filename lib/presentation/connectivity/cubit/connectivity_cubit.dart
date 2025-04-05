import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  ConnectivityCubit() : super(ConnectivityInitial()) {
    _initConnectivity();
  }

  void _initConnectivity() {
    streamSubscription = connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.none)) {
        emit(const ConnectivityDisconnected());
      } else {
        emit(const ConnectivityConnected());
      }
    });
  }
}
