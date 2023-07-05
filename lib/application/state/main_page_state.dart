import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageState {
  String text;
  // String font;
  // Color fontColor;
  // int fontSize;
  // Color backgroundColor;
  // Alignment textPosition;

  MainPageState({
    this.text = 'おがわ',
    // this.font = 'Roboto',
    // this.fontColor = Colors.black,
    // this.fontSize = 50,
    // this.backgroundColor = Colors.greenAccent,
    // this.textPosition = Alignment.center,
  });

  MainPageState copyWith({
    String? text,
    // String? font,
    // Color? fontColor,
    // int? fontSize,
    // Color? backgroundColor,
    // Alignment? textPosition,
  }) {
    return MainPageState(
      text: text ?? this.text,
      // font: font ?? this.font,
      // fontColor: fontColor ?? this.fontColor,
      // fontSize: fontSize ?? this.fontSize,
      // backgroundColor: backgroundColor ?? this.backgroundColor,
      // textPosition: textPosition ?? this.textPosition,
    );
  }
}