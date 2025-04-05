import 'package:feelcast/presentation/weather/cubit/cubit.dart';
import 'package:feelcast/support/constant/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class WeatherAnimation extends StatelessWidget {
  const WeatherAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    getLottieAsset(String? value) {
      switch (value) {
        case '1':
          return AssetPath.clearSky;
        case '3':
          return AssetPath.sunnySky;
        case '4':
          return AssetPath.cloudySky;
        default:
          return AssetPath.rainySky;
      }
    }

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          return SizedBox(
            height: 50,
            child: Lottie.asset(
              getLottieAsset(state.currentSkyData?.fcstValue),
              fit: BoxFit.contain,
              repeat: true,
            ),
          );
        } else if (state is WeatherError) {
          return Center(child: Text('하늘 에러: ${state.message}'));
        }
        return const Center(child: Text('날씨 정보를 다시 불러오세요.'));
      },
    );
  }
}
