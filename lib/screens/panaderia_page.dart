import 'package:flutter/material.dart';

class PanaderiaPage extends StatelessWidget {
  const PanaderiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panadería")),
      body: const Center(
        child: Text("Productos de Panadería 🍞"),
      ),
    );
  }
}
