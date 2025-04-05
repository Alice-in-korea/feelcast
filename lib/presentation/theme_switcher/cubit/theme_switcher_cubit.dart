import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_switcher_state.dart';

class ThemeSwitcherCubit extends Cubit<ThemeSwitcherState> {
  ThemeSwitcherCubit() : super(ThemeSwitcherState());

  void switchColorTheme(ThemeMode currentThemeMode) {
    currentThemeMode == ThemeMode.light
        ? emit(state.copyWith(themeMode: ThemeMode.dark))
        : emit(state.copyWith(themeMode: ThemeMode.light));
  }
}
