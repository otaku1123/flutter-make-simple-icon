import 'package:flutter/material.dart';

class MainPageState {
  String text;
  String font;
  int fontSize;
  FontWeight fontWeight;
  Color fontColor;
  Color backgroundColor;
  int letterSpacing;
  int wordSpacing;
  // memo: 下線などは定義していない

  Alignment textAlign;

  MainPageState({
    this.text = 'おがわ',
    this.font = 'Roboto',
    this.fontSize = 50,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
    this.backgroundColor = Colors.greenAccent,
    this.letterSpacing = 0,
    this.wordSpacing = 0,
    this.textAlign = Alignment.center,
  });

  MainPageState copyWith({
    String? text,
    String? font,
    int? fontSize,
    FontWeight? fontWeight,
    Color? fontColor,
    Color? backgroundColor,
    int? letterSpacing,
    int? wordSpacing,
    Alignment? textAlign,
  }) {
    return MainPageState(
      text: text ?? this.text,
      font: font ?? this.font,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontColor: fontColor ?? this.fontColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textAlign: textAlign ?? this.textAlign,
    );
  }
}