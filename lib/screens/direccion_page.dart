import 'package:flutter/material.dart';

class DireccionPage extends StatelessWidget {
  const DireccionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dirección"),
        backgroundColor: const Color(0xFFE8C27D),
      ),
      backgroundColor: const Color(0xFFF2EACB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dirección de entrega",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            _input("Distrito"),
            const SizedBox(height: 12),
            _input("Dirección exacta"),
            const SizedBox(height: 12),
            _input("Referencia"),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8C27D),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  "GUARDAR DIRECCIÓN",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFE8C27D),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
