// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class indEnScreen extends StatelessWidget {
  const indEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IndEnScreen(inden: ''),
    );
  }
}

class IndEnScreen extends StatefulWidget {
  const IndEnScreen({
    super.key,
    required this.inden,
  });

  final String inden;

  @override
  State<IndEnScreen> createState() {
    return _IndEnScreenState();
  }
}

class _IndEnScreenState extends State<IndEnScreen> {
  final translator = GoogleTranslator();
  final TextEditingController _textEditingController = TextEditingController();
  String _inputText = '';
  String _outputText = '';

  void _translateText() {
    translator.translate(_inputText, to: 'en').then((translation) {
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
        title: const Text('Indonesia ke English'),
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
              child: const Text('Terjemahkan ke Inggris'),
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