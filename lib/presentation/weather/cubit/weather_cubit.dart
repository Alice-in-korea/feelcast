import 'package:feelcast/core/core.dart';
import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit({required this.repository}) : super(WeatherInitial());

  Future<void> fetchWeatherInfos(int nx, int ny) async {
    emit(WeatherLoading());

    try {
      final List<List<Item>> datas = await Future.wait([
        _fetchWeather(nx, ny),
        _fetchUltraShortTermForecast(nx, ny),
      ]);

      emit(
        WeatherLoaded(
          currentWeather: datas[0],
          ultraShortThermForecast: datas[1],
        ),
      );
    } on RepositoryException catch (e) {
      emit(
        WeatherError(
          code: e.code,
          message: e.message ?? '실황 데이터를 가져오는 데 실패했습니다! $e',
        ),
      );
    }
  }

  Future<List<Item>> _fetchWeather(int nx, int ny) async {
    List<Item> allTempItems = [];

    try {
      final WeatherResponseDto data = await repository.fetchCurrentWeatherData(
        baseDate: TimeUtil.getTodayDate(),
        baseTime: TimeUtil.getCurrentTime(),
        nx: nx,
        ny: ny,
      );

      return data.response.body.items.item;
    } on RepositoryException catch (e) {
      //TODO 로컬에 저장한 직전 정보 가져오기
      emit(
        WeatherError(
          code: e.code,
          message: e.message ?? '기온 정보를 가져오는 데 실패했습니다. $e',
        ),
      );
      return allTempItems;
    }
  }

  Future<List<Item>> _fetchUltraShortTermForecast(int nx, int ny) async {
    int page = 1;
    bool hasSkyDataFound = false;
    List<Item> allSkyItems = [];

    try {
      //NOTE 초단기예보는 데이터양이 상대적으로 많아 페이지네이션으로 구현.
      //NOTE 필요로 하는 category인 'SKY'가 포함된 데이터가 나올 때까지 반복.
      while (!hasSkyDataFound) {
        final WeatherResponseDto data = await repository
            .fetchUltraShortTermForecastData(
              baseDate: TimeUtil.getTodayDate(),
              baseTime: TimeUtil.getTime1HoursAgo(),
              nx: nx,
              ny: ny,
              pageNo: page,
            );

        final skyItems =
            data.response.body.items.item
                .where((item) => item.category == "SKY")
                .toList();

        if (skyItems.isNotEmpty) {
          allSkyItems.addAll(skyItems);

          hasSkyDataFound = true;
        }

        page++;
      }
      return allSkyItems;
    } on RepositoryException catch (e) {
      //TODO 로컬에 저장한 직전 정보 가져오기
      emit(
        WeatherError(
          code: e.code,
          message: e.message ?? '하늘 정보를 가져오는 데 실패했습니다. $e',
        ),
      );

      return allSkyItems;
    }
  }
}
