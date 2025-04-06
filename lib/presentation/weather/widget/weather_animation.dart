import 'package:feelcast/presentation/weather/cubit/cubit.dart';
import 'package:feelcast/support/constant/asset_path.dart';
import 'package:feelcast/support/style/style.dart';
import 'package:feelcast/support/util/util.dart';
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

    return BlocConsumer<ForecastCubit, ForecastState>(
      listener: (context, state) {
        if (state is ForecastError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('화면을 아래로 당겨서 새로고침 해보세요'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ForecastLoading) {
          return SizedBox(width: context.screenWidth * 0.5);
        } else if (state is ForecastLoaded) {
          return SizedBox(
            width: context.screenWidth * 0.5,
            child: Lottie.asset(
              getLottieAsset(state.currentSkyData?.fcstValue),
              repeat: true,
            ),
          );
        } else if (state is ForecastError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Text('하늘 에러', style: MyTextStyle.f16b),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.error, color: AppColors.red),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: Text('날씨 정보를 다시 불러오세요.'));
      },
    );
  }
}
