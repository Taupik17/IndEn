// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class javInScreen extends StatelessWidget {
  const javInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: JavIdScreen(javid: ''),
    );
  }
}

class JavIdScreen extends StatefulWidget {
  const JavIdScreen({
    super.key,
    required this.javid,
  });

  final String javid;

  @override
  State<JavIdScreen> createState() {
    return _JavIdScreenState();
  }
}

class _JavIdScreenState extends State<JavIdScreen> {
  final translator = GoogleTranslator();
  final TextEditingController _textEditingController = TextEditingController();
  String _inputText = '';
  String _outputText = '';

  void _translateText() {
    translator.translate(_inputText, to: 'jw').then((translation) {
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
        title: const Text('Indonesia ke Javanese'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              onChanged: (text) {
                setState(() {
                  _inputText = text;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Masukkan Teks',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _translateText,
              child: const Text('Terjemahkan ke Javanese'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hasil Terjemahan:',
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