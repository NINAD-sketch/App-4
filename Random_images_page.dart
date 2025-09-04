import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomImagesPage extends StatefulWidget {
  const RandomImagesPage({super.key});

  @override
  State<RandomImagesPage> createState() => _RandomImagesPageState();
}

class _RandomImagesPageState extends State<RandomImagesPage> {
  String imageUrl = '';

  Future<void> fetchRandomDogImage() async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breeds/image/random'),
    );
    final data = json.decode(response.body);
    setState(() => imageUrl = data['message']);
  }

  Future<void> fetchRandomCatImage() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/images/search'),
    );
    final data = json.decode(response.body);
    setState(() => imageUrl = data[0]['url']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("🐶🐱 Random Pet Viewer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl.isNotEmpty
                ? Image.network(imageUrl, height: 300)
                : const Text('Tap a button to see an image!'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: fetchRandomDogImage,
              child: const Text(
                "Show Random Dog",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: fetchRandomCatImage,
              child: const Text(
                "Show Random Cat",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
