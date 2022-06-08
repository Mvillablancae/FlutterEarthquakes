import 'package:flutter/material.dart';

enum DeviceScreenType { Small, Medium, Large }

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.orientation,
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation: $orientation, DeviceType: $deviceScreenType, ScreenSize $screenSize, localWidgetSize: $localWidgetSize';
  }
}
