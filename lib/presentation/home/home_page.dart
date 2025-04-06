import 'package:feelcast/presentation/connectivity/connectivity.dart';
import 'package:feelcast/presentation/location/location.dart';
import 'package:feelcast/presentation/theme_switcher/theme_switcher.dart';
import 'package:feelcast/presentation/weather/weather.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    final xy = context.read<LocationCubit>().state.xy;

    _listener = context.read<LocationCubit>().init();

    Workmanager()
        .registerPeriodicTask(
          weatherPeriodicTask,
          weatherPeriodicTask,
          frequency: Duration(minutes: 15),
          flexInterval: Duration(minutes: 10),
          initialDelay: Duration(minutes: 10),
          inputData: {'x': xy.x, 'y': xy.y},
          constraints: Constraints(
            ///인터넷이 연결돼 있어야 작업을 실행
            networkType: NetworkType.connected,

            ///기기가 유휴 상태일 때만 작업 실행
            // requiresDeviceIdle: true,
          ),
        )
        .then((value) {
          LogHelper.logInfo("✅✅ Periodic Task registered: ");
        })
        .catchError((e) {
          LogHelper.logError("❌❌ Failed to register periodic task: $e");
        });
  }

  @override
  void dispose() {
    _listener.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final xy = context.read<LocationCubit>().state.xy;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          leading: ConnectivityWidget(),
          actions: [ThemeSwitchWidget()],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final isOnNetwork =
                context.read<ConnectivityCubit>().state
                    is ConnectivityConnected;

            if (isOnNetwork) {
              await Future.wait([
                context.read<WeatherCubit>().fetchWeather(xy.x, xy.y),
                context.read<ForecastCubit>().fetchUltraShortTermForecast(
                  xy.x,
                  xy.y,
                ),
              ]);

              return;
            } else {
              await Future.wait([
                context.read<WeatherCubit>().fetchLocalWeather(),
                context
                    .read<ForecastCubit>()
                    .fetchLocalUltraShortTermForecast(),
              ]);
            }

            return;
          },

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(height: context.screenHeight * 0.15),
                WeatherDisplay(nx: xy.x, ny: xy.y),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
