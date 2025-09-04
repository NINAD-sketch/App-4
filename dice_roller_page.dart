import 'dart:math';
import 'package:flutter/material.dart';

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  int dice = 1; // Initialize with 1 (valid dice value)

  void rollDice() {
    int randomValue = Random().nextInt(6) + 1; // Dice has 6 sides (1-6)
    setState(() {
      dice = randomValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leadingWidth: 50,
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Dice Roller',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: rollDice, // Added the roll functionality back
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/dics$dice.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  // Fixed error handling - removed duplicate image
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[100],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              '$dice',
                              style: TextStyle(
                                fontSize: 120,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Tap anywhere to roll the dice!',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
