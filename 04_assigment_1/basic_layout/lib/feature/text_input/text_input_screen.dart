import 'package:flutter/material.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  late final TextEditingController textC;

  @override
  void initState() {
    super.initState();
    textC = TextEditingController();
  }

  @override
  void dispose() {
    textC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: textC,
            ),
          ],
        ),
      ),
    );
  }
}
