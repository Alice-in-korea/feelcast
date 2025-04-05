part of 'connectivity_cubit.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object?> get props => [];
}

class ConnectivityInitial extends ConnectivityState {
  const ConnectivityInitial();
}

class ConnectivityConnected extends ConnectivityState {
  const ConnectivityConnected();
}

class ConnectivityDisconnected extends ConnectivityState {
  const ConnectivityDisconnected();
}
