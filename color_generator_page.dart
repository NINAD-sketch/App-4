import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorGeneratorPage extends StatefulWidget {
  const ColorGeneratorPage({super.key});

  @override
  State<ColorGeneratorPage> createState() => _ColorGeneratorPageState();
}

class _ColorGeneratorPageState extends State<ColorGeneratorPage> {
  Color currentColor = Colors.blue;

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("🎨 Color Generator"),
      ),
      body: Container(
        color: currentColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tap below to pick a color",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      final screenWidth = MediaQuery.of(ctx).size.width;
                      final screenHeight = MediaQuery.of(ctx).size.height;

                      return AlertDialog(
                        title: const Text(
                          'Pick a Color',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: screenWidth * 0.8,
                              maxHeight: screenHeight * 0.6,
                            ),
                            child: ColorPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                              enableAlpha: true,
                              labelTypes: const [ColorLabelType.rgb],
                              displayThumbColor: true,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "Pick Color",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
