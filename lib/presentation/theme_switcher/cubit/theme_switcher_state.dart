part of 'theme_switcher_cubit.dart';

class ThemeSwitcherState extends Equatable {
  const ThemeSwitcherState({this.themeMode = ThemeMode.dark});

  final ThemeMode themeMode;

  bool get isLightMode => themeMode == ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [themeMode];

  ThemeSwitcherState copyWith({ThemeMode? themeMode}) {
    return ThemeSwitcherState(themeMode: themeMode ?? this.themeMode);
  }
}
