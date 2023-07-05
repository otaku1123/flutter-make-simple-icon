import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  Uint8List? bytes;
  final globalKey = GlobalKey();

  Future<void> widgetToImage() async {
    final boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return;
    }
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    bytes = byteData?.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text('画像化'),
                  onPressed: () async {
                    await widgetToImage();
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),

                // この widget を画像化したい
                RepaintBoundary(
                  key: globalKey,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 320,
                    height: 200,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text('この下にイメージ化したWidgetが表示されます'),
                const SizedBox(height: 32),
                // もし画像化されればここに表示される
                if (bytes != null) Image.memory(bytes!.buffer.asUint8List())
              ],
            ),
          ),
        ),
      ),
    );
  }
}