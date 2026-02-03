import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pan_fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Oscurecer
          Container(color: Colors.black.withOpacity(0.45)),

          // Contenido
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.storefront,
                    size: 100, color: Colors.white),

                const SizedBox(height: 20),

                const Text(
                  "Delicias del Centro",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Panadería & Pastelería\nHecho con amor",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8C27D),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text(
                    "EMPEZAR",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
