import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext{
  // Get screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  // Quick access to width and height
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Quick access to safe area padding (top/bottom bars)
  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);
}