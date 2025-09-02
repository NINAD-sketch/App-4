import 'package:assignment_4/Random_images_page.dart';
import 'package:assignment_4/color_generator_page.dart';
import 'package:assignment_4/dice_roller_page.dart';

import 'package:assignment_4/text_to_speech_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = const [
    RandomImagesPage(),
    ColorGeneratorPage(),
    TextToSpeechPage(),
    DiceRollerPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        elevation: 10,
        fixedColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 24),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        iconSize: 30,
        currentIndex: _index, // Shows the selected tab
        onTap: (newIndex) {
          setState(() {
            _index = newIndex; // Updates the selected page
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Pets"),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: "Colors",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: "TTS",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.casino), label: "Dice"),
        ],
      ),
    );
  }
}
