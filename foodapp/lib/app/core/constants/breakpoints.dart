import 'package:flutter/cupertino.dart';

enum Device { Mobile, Tablet, Desktop, UnSupported }

class Breakpoints {
  BuildContext? context;
  Breakpoints({this.context});

  static const int MobileWidth = 576;
  static const int TabletWidth = 1024;
  static const int DesktopWidth = 1920;

  double get width => MediaQuery.of(context!).size.width;

  bool get isMobile => width < MobileWidth;

  bool get isTablet => width >= MobileWidth && width <= TabletWidth;

  bool get isDesktop => width > TabletWidth && width <= DesktopWidth;

  Device device() {
    if (isMobile) return Device.Mobile;
    if (isTablet) return Device.Tablet;
    if (isDesktop) return Device.Desktop;
    return Device.UnSupported;
  }
}

class DeviceSize {
  static const DeviceInfo mobile = DeviceInfo(
    size: Size(375, 812),
    name: "Iphone 13 Mini",
  );

  static const DeviceInfo desktop = DeviceInfo(
    size: Size(1280, 720),
    name: "Macbook Pro 2022",
    maxSize: Size(1920, 1080),
    minSize: Size(854, 600),
  );
}

class DeviceInfo {
  final String name;
  final Size size;
  final Size? minSize;
  final Size? maxSize;
  const DeviceInfo({
    required this.name,
    this.minSize,
    required this.size,
    this.maxSize,
  });
}
