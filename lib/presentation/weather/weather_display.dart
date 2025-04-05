import 'package:feelcast/presentation/weather/weather.dart';
import 'package:feelcast/support/style/style.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDisplay extends StatefulWidget {
  final int nx;
  final int ny;

  const WeatherDisplay({super.key, required this.nx, required this.ny});

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  int get nx => widget.nx;
  int get ny => widget.ny;

  @override
  void initState() {
    super.initState();

    context.read<WeatherCubit>().fetchWeatherInfos(nx, ny);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final baseTime = state.currentTempData?.baseTime;
          final displayTimeText =
              baseTime != null
                  ? '${TimeUtil.formatStringToTime(baseTime)}시 기준'
                  : '';

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('지금은', style: MyTextStyle.f12b),
                      Text(
                        WeatherFormatters.formatTemperature(
                          state.currentTempData?.obsrValue,
                        ),
                        style: MyTextStyle.f24b,
                      ),
                    ],
                  ),
                  WeatherAnimation(),
                ],
              ),
              if (state.currentTempData?.baseTime != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(displayTimeText, style: MyTextStyle.f12b),
                ),
            ],
          );
        } else if (state is WeatherError) {
          return Center(child: Text('기온 에러: ${state.message}'));
        }
        return const Center(child: Text('날씨 정보를 다시 불러 올께요.'));
      },
    );
  }
}
