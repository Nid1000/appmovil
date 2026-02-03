import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ===== IMPORTS DE PANTALLAS =====
import 'screens/welcome_page.dart';
import 'screens/my_home_page.dart';
import 'screens/panaderia_page.dart';
import 'screens/pasteleria_page.dart';
import 'screens/registro_page.dart';
import 'screens/pedidos.dart';
import 'screens/proyectos_page.dart';

void main() {
  runApp(const MyApp());
}

// ===== CONFIGURACIÓN DE RUTAS =====
final GoRouter _router = GoRouter(
  initialLocation: '/welcome',
  routes: [

    // ===== BIENVENIDA =====
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),

    // ===== HOME =====
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const MyHomePage(title: 'Delicias del Centro'),
    ),

    // ===== PANADERÍA =====
    GoRoute(
      path: '/panaderia',
      builder: (context, state) => const PanaderiaPage(),
    ),

    // ===== PASTELERÍA =====
    GoRoute(
      path: '/pasteleria',
      builder: (context, state) => const PasteleriaPage(),
    ),

    // ===== REGISTRO =====
    GoRoute(
      path: '/registro',
      builder: (context, state) => const RegistroPage(),
    ),

    // ===== PEDIDOS =====
    GoRoute(
      path: '/pedidos',
      builder: (context, state) => const PedidosPage(),
    ),

    // ===== PROYECTOS =====
    GoRoute(
      path: '/proyectos',
      builder: (context, state) => const ProyectosPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
