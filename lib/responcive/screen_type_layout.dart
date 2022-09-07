import 'package:flutter/material.dart';
import 'package:layout_test/responcive/device_type.dart';
import 'package:layout_test/responcive/utils.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = sizeToDeviceType(
      MediaQuery.of(context).size.width,
    );

    switch (deviceType) {
      case DeviceType.desktop:
        return desktop ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }
}
