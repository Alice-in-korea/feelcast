import 'package:flutter/material.dart';

extension DeviceSize on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get viewInsetsBottom => MediaQuery.viewInsetsOf(this).bottom;

  double get bottomPadding => MediaQuery.paddingOf(this).bottom;
  double get topPadding => MediaQuery.paddingOf(this).top;

  bool get isTablet => MediaQuery.sizeOf(this).shortestSide > 600;

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;
}
