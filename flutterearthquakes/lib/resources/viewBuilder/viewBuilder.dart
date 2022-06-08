import 'package:flutter/material.dart';
import './sizing_information.dart';

class ViewBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  ViewBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraints) {
      SizingInformation sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: DeviceScreenType.Medium,
        screenSize: Size(mediaQuery.size.width,
            (mediaQuery.size.height + mediaQuery.viewInsets.bottom)),
        localWidgetSize: Size(
          boxConstraints.maxWidth,
          boxConstraints.maxHeight,
        ),
      );
      return builder(context, sizingInformation);
    });
  }
}
