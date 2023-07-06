import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_simple_image_app/application/view_model/main_page_view_model.dart';

class ColorPickerWidget extends ConsumerWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorPicker(
      pickerColor: ref.watch(mainPageViewModelProvider).fontColor,
      onColorChanged: (color) {
        ref.read(mainPageViewModelProvider.notifier).changeFontColor(color);
      },
      colorPickerWidth: 100,
    );
  }
}
