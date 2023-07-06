import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_simple_image_app/application/view_model/main_page_view_model.dart';

class ColorPickerWidget extends ConsumerWidget {
  final Color pickerColor;
  final Function onChanged;

  const ColorPickerWidget(this.pickerColor, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorPicker(
      pickerColor: pickerColor,
      onColorChanged: (color) {
        onChanged(color);
      },
      colorPickerWidth: 100,
    );
  }
}
