import 'package:cdd_mobile_frontend/common/util/util.dart';
import 'package:cdd_mobile_frontend/common/value/value.dart';
import 'package:flutter/material.dart';

Widget primaryBtn({
  @required VoidCallback onPressed,
  double height = 45.0,
  double width = 250.0,
  Color bgColor = Colours.app_main,
  @required String title,
  double fontSize = 20.0,
  BorderRadiusGeometry radii = Radii.k24pxRadius,
}) {
  return Container(
    height: sHeight(height),
    width: sWidth(width),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: radii,
    ),
    child: FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: sSp(fontSize),
        ),
      ),
    ),
  );
}

/// 纯文本button
Widget textBtnFlatButtonWidget({
  @required VoidCallback onPressed,
  @required String title,
  Color textColor = AppColor.primaryElement,
  double fontSize = 17,
}) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: sSp(fontSize),
        color: textColor,
      ),
    ),
  );
}

/*
/// 有背景色button
Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 240.0,
  double height = 48.0,
  Color bgColor = AppColor.primaryElement,
  String title = "button",
  Color fontColor = AppColor.primaryElementText,
  double fontSize = 18.0,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: sWidth(width),
    height: sHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k10pxRadius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontSize: sSp(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}
*/