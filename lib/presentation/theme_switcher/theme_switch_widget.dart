import 'package:feelcast/presentation/theme_switcher/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.isLightMode
                ? Icons.wb_sunny_outlined
                : Icons.nights_stay_outlined,
          ),
          onPressed: () {
            context.read<ThemeSwitcherCubit>().switchColorTheme(
              state.themeMode,
            );
          },
        );
      },
    );
  }
}
