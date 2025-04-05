import 'package:feelcast/model/model.dart';
import 'package:feelcast/support/enum/enum.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDBIsar {
  LocalDBIsar._internal();

  late final Isar isar;

  static final LocalDBIsar _instance = LocalDBIsar._internal();

  static LocalDBIsar get instance => _instance;

  /// init
  Future<void> initLocalDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      isar = await Isar.open(
        [SavedWeatherDataSchema],
        inspector: true, // 디버그 모드에서만 툴 사용
        directory: dir.path,
      );
    } else {
      isar = Isar.getInstance()!;
    }
  }

  /// get
  Future<List<SavedWeatherData>> getCurrentWeatherLocalData() async {
    return isar.savedWeatherDatas
        .filter()
        .typeEqualTo(WeatherDataType.currentWeather.name)
        .findAll();
  }

  Future<List<SavedWeatherData>> getUltraShortTermForecastLocalData() async {
    return isar.savedWeatherDatas
        .filter()
        .typeEqualTo(WeatherDataType.ultraShortTermForecast.name)
        .findAll();
  }

  /// update
  Future<void> updateLocalWeatherData(SavedWeatherData newWeatherData) async {
    isar.writeTxnSync(() => isar.savedWeatherDatas.putSync(newWeatherData));
  }

  /// delete
  Future<void> deleteLocalDBByType(String type) async {
    final prevData =
        await isar.savedWeatherDatas.filter().typeEqualTo(type).findAll();

    await isar.writeTxn(() async {
      await isar.savedWeatherDatas.deleteAll(
        prevData.map((e) => e.id).toList(),
      );
    });
  }
}
