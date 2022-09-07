enum DeviceType {
  mobile(0, 599),
  tablet(600, 839),
  desktop(840, double.infinity);

  final double minSize;
  final double maxSize;

  const DeviceType(this.minSize, this.maxSize);
}
