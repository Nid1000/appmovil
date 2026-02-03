import 'package:flutter/material.dart';

class PasteleriaPage extends StatelessWidget {
  const PasteleriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pastelería")),
      body: const Center(
        child: Text("Productos de Pastelería 🎂"),
      ),
    );
  }
}
