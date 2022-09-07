import 'package:layout_test/responcive/device_type.dart';

DeviceType sizeToDeviceType(double size) {
  if (size > DeviceType.desktop.minSize) {
    return DeviceType.desktop;
  }

  if (size > DeviceType.tablet.minSize && size < DeviceType.tablet.maxSize) {
    return DeviceType.tablet;
  }

  return DeviceType.mobile;
}
