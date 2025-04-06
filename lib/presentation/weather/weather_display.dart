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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<WeatherCubit>().fetchWeather(nx, ny),
        context.read<ForecastCubit>().fetchUltraShortTermForecast(nx, ny),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [WeatherText(), WeatherAnimation()],
        ),

        WeatherBaseTimeText(),
      ],
    );
  }
}

class WeatherText extends StatelessWidget {
  const WeatherText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('화면을 아래로 당겨서 새로고침 해보세요'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const SizedBox.shrink();
        } else if (state is WeatherLoaded) {
          return Column(
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
          );
        } else if (state is WeatherError) {
          return Center(
            child: Column(
              children: [
                Text('기온 에러', style: MyTextStyle.f16b),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),

                  child: Icon(Icons.error, color: AppColors.red),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('날씨 정보를 다시 불러 올께요.'));
      },
    );
  }
}

class WeatherBaseTimeText extends StatelessWidget {
  const WeatherBaseTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return SizedBox.shrink();
          } else if (state is WeatherLoaded) {
            final baseTime = state.currentTempData?.baseTime;
            final displayTimeText =
                baseTime != null
                    ? '${TimeUtil.formatStringToTime(baseTime)}시 기준'
                    : '';

            if (state.currentTempData?.baseTime != null) {
              return Align(
                alignment: Alignment.centerRight,
                child: Text(displayTimeText, style: MyTextStyle.f12b),
              );
            }

            return SizedBox.shrink();
          } else if (state is WeatherError) {
            return SizedBox.shrink();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
