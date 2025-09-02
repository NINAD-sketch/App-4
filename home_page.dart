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
