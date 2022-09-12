// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeigth() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static double pokeImgSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }
}
