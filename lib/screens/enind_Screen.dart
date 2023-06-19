// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class enIndScreen extends StatelessWidget {
  const enIndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EnIndScreen(enind: ''),
    );
  }
}

class EnIndScreen extends StatefulWidget {
  const EnIndScreen({
    super.key,
    required this.enind,
  });

  final String enind;

  @override
  State<EnIndScreen> createState() {
    return _EnIndScreenState();
  }
}

class _EnIndScreenState extends State<EnIndScreen> {
  // int _currentindex = 1;
  final translator = GoogleTranslator();
  final TextEditingController _textEditingController = TextEditingController();
  String _inputText = '';
  String _outputText = '';

  void _translateText() {
    translator.translate(_inputText, to: 'id').then((translation) {
      setState(() {
        _outputText = translation.toString();
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English to Indonesia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // _widgetOptions.elementAt(_currentindex),
            TextField(
              controller: _textEditingController,
              onChanged: (text) {
                setState(() {
                  _inputText = text;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Input Teks',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _translateText,
              child: const Text('Translate to Indonesia'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Translation Results:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _outputText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
