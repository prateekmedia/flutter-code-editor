import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

import '../common/themes.dart';
import 'constants/constants.dart';
import 'widgets/dropdown_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _language = languageList[0];
  String _theme = themeList[0];

  late CodeController _codeController = codeControllers[_language]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Editor by Akvelon'),
        actions: [
          DropdownSelector(
              onChanged: _setLanguage,
              icon: Icons.code,
              value: _language,
              values: languageList),
          const SizedBox(
            width: 20,
          ),
          DropdownSelector(
              onChanged: _setTheme,
              icon: Icons.color_lens,
              value: _theme,
              values: themeList),
        ],
      ),
      body: SingleChildScrollView(
        child: CodeTheme(
          data: CodeThemeData(styles: themes[_theme]),
          child: CodeField(
            controller: _codeController,
            textStyle: const TextStyle(fontFamily: 'SourceCode'),
            lineNumberStyle: const LineNumberStyle(
              textStyle: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setLanguage(String value) {
    setState(() {
      _language = value;
      _codeController = codeControllers[_language]!;
    });
  }

  void _setTheme(String value) {
    setState(() {
      _theme = value;
    });
  }
}
