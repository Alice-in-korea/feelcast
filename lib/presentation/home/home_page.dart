import 'package:feelcast/presentation/connectivity/connectivity.dart';
import 'package:feelcast/presentation/location/location.dart';
import 'package:feelcast/presentation/theme_switcher/theme_switcher.dart';
import 'package:feelcast/presentation/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                WeatherDisplay(nx: xy.x, ny: xy.y),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
