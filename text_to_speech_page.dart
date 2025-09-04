import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechPage extends StatefulWidget {
  const TextToSpeechPage({super.key});

  @override
  State<TextToSpeechPage> createState() => _TextToSpeechPageState();
}

class _TextToSpeechPageState extends State<TextToSpeechPage> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller = TextEditingController();

  void speak() async {
    if (controller.text.isNotEmpty) {
      await tts.speak(controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("🗣️ Text to Speech"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter text to speak',
                border: OutlineInputBorder(),
                hintText: 'Type something here...',
                labelStyle: TextStyle(fontSize: 18, color: Colors.deepPurple),
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              controller: controller,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: speak,
              child: const Text(
                "Speak",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
