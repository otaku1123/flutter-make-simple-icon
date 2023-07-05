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

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(
      text: ref.read(mainPageViewModelProvider).text,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
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
          Expanded(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Right property'),
                  ),
                ),
                Row(
                  children: [
                    Text('text'),

                    SizedBox(
                      width: 400,
                      child: TextField(
                        controller: _textController,
                        onChanged: (text) {
                          ref
                              .read(mainPageViewModelProvider.notifier)
                              .changeText(text);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: Center(
        child: Text(
          ref.watch(mainPageViewModelProvider).text,
        ),
      ),
    );
  }
}
