import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feelcast/support/util/util.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final SecureStorageUtils storage;

  LocationCubit(this.storage) : super(LocationState.init());

  Future<void> initStorage() async {
    final (lat, lng) = await storage.getLocation();
    emit(LocationState(latitude: lat, longitude: lng));
  }
}
