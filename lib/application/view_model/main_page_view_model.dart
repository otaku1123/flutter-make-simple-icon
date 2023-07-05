import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_page_state.dart';

final mainPageViewModelProvider =
    StateNotifierProvider<MainPageViewModel, MainPageState>(
  (ref) => MainPageViewModel(ref),
);

class MainPageViewModel extends StateNotifier<MainPageState> {

  MainPageViewModel(this._ref) : super(MainPageState());

  final Ref _ref;

  // MainPageから参照する変数
  get text => _ref.watch(mainPageViewModelProvider).text;

  void changeText(String text) {
    state = state.copyWith(text: text);
  }

  void changeFont(String font) {
    state = state.copyWith(font: font);
  }

  void changeFontSize(double fontSize) {
    state = state.copyWith(fontSize: fontSize);
  }

  void changeFontWeight(FontWeight fontWeight) {
    state = state.copyWith(fontWeight: fontWeight);
  }

  void changeFontColor(Color fontColor) {
    state = state.copyWith(fontColor: fontColor);
  }

  void changeBackgroundColor(Color backgroundColor) {
    state = state.copyWith(backgroundColor: backgroundColor);
  }

  void changeLetterSpacing(double letterSpacing) {
    state = state.copyWith(letterSpacing: letterSpacing);
  }

  void changeWordSpacing(double wordSpacing) {
    state = state.copyWith(wordSpacing: wordSpacing);
  }

  void changeTextAlign(TextAlign textAlign) {
    state = state.copyWith(textAlign: textAlign);
  }
}