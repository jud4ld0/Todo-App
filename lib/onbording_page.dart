import 'package:flutter/material.dart';
import 'package:mohammed/first_page.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 119, 18, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                "Welcome to Your Task Manager",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => FirstPage()),
                  );
                },
                child: const Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}