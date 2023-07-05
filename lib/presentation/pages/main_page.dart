import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_simple_image_app/application/view_model/main_page_view_model.dart';
import 'package:make_simple_image_app/presentation/pages/settings_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  late TextEditingController _textController;
  late TextEditingController _fontSizeController;
  late TextEditingController _letterSpacingController;
  late TextEditingController _wordSpacingController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(
      text: ref.read(mainPageViewModelProvider).text,
    );
    _fontSizeController = TextEditingController(
      text: ref.read(mainPageViewModelProvider).fontSize.toString(),
    );
    _letterSpacingController = TextEditingController(
      text: ref.read(mainPageViewModelProvider).letterSpacing.toString(),
    );
    _wordSpacingController = TextEditingController(
      text: ref.read(mainPageViewModelProvider).wordSpacing.toString(),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _fontSizeController.dispose();
    _letterSpacingController.dispose();
    _wordSpacingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.settings),
              title: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SettingsPage();
                      },
                    ),
                  );
                },
                child: const Text('Settings'),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: _buildImage(),
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          Expanded(
            child: Column(
              children: [
                _buildPropertyItem(
                  'text',
                  _buildTextField(
                    _textController,
                    (text) {
                      ref
                          .read(mainPageViewModelProvider.notifier)
                          .changeText(text);
                    },
                  ),
                ),
                _buildPropertyItem(
                  'font',
                  Text('font'), // ドロップダウンリストがいいかもしれない
                ),
                _buildPropertyItem(
                  'font size',
                  _buildTextField(_fontSizeController, (text) {
                    ref
                        .read(mainPageViewModelProvider.notifier)
                        .changeFontSize(double.tryParse(text) ?? 0);
                  }),
                ),
                _buildPropertyItem(
                  'font weight',
                  Text('font weight'),
                ),
                _buildPropertyItem(
                  'letter spacing',
                  _buildTextField(_letterSpacingController, (text) {
                    ref
                        .read(mainPageViewModelProvider.notifier)
                        .changeLetterSpacing(double.tryParse(text) ?? 0);
                  }),
                ),
                _buildPropertyItem(
                  'word spacing',
                  _buildTextField(_wordSpacingController, (text) {
                    ref
                        .read(mainPageViewModelProvider.notifier)
                        .changeWordSpacing(double.tryParse(text) ?? 0);
                  }),
                ),
                _buildPropertyItem(
                  'text align',
                  Text('text align'),
                ),
                _buildPropertyItem(
                  'font color',
                  Text('font color'),
                ),
                _buildPropertyItem(
                  'background color',
                  Text('background color'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyItem(String title, Widget content) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(title),
        ),
        Expanded(
          flex: 3,
          child: content,
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, Function onChanged) {
    return SizedBox(
      width: 400,
      child: TextField(
        controller: controller,
        onChanged: (text) {
          onChanged(text);
        },
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      color: ref.watch(mainPageViewModelProvider).backgroundColor,
      child: Center(
        child: Text(
          ref.watch(mainPageViewModelProvider).text,
          style: TextStyle(
            color: ref.watch(mainPageViewModelProvider).fontColor,
            fontSize: ref.watch(mainPageViewModelProvider).fontSize,
            fontWeight: ref.watch(mainPageViewModelProvider).fontWeight,
            letterSpacing: ref.watch(mainPageViewModelProvider).letterSpacing,
            wordSpacing: ref.watch(mainPageViewModelProvider).wordSpacing,
          ),
          textAlign: ref.watch(mainPageViewModelProvider).textAlign,
        ),
      ),
    );
  }
}
