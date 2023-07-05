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
}