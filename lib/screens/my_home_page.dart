import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EACB),

      // ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8C27D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Delicias del Centro",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),

      // ===== DRAWER (MENÚ 3 PALITOS) =====
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFE8C27D),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.storefront, size: 48, color: Colors.black),
                  SizedBox(height: 10),
                  Text(
                    "Delicias del Centro",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Panadería & Pastelería"),
                ],
              ),
            ),

            _drawerItem(
              context,
              icon: Icons.home,
              text: "Inicio",
              onTap: () => context.go('/'),
            ),
            _drawerItem(
              context,
              icon: Icons.bakery_dining,
              text: "Panadería",
              onTap: () => context.go('/panaderia'),
            ),
            _drawerItem(
              context,
              icon: Icons.cake,
              text: "Pastelería",
              onTap: () => context.go('/pasteleria'),
            ),
            _drawerItem(
              context,
              icon: Icons.receipt_long,
              text: "Pedidos",
              onTap: () => context.go('/pedidos'),
            ),
            _drawerItem(
              context,
              icon: Icons.person,
              text: "Iniciar sesión / Registrarse",
              onTap: () => context.go('/registro'),
            ),
          ],
        ),
      ),

      // ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _menuItem(
                    icon: Icons.home,
                    title: "INICIO",
                    onTap: () => context.go('/'),
                  ),
                  _menuItem(
                    icon: Icons.bakery_dining,
                    title: "PANADERÍA",
                    onTap: () => context.go('/panaderia'),
                  ),
                  _menuItem(
                    icon: Icons.cake,
                    title: "PASTELERÍA",
                    onTap: () => context.go('/pasteleria'),
                  ),
                  _menuItem(
                    icon: Icons.receipt_long,
                    title: "PEDIDOS",
                    onTap: () => context.go('/pedidos'),
                  ),
                  const Divider(),
                  _menuItem(
                    icon: Icons.person,
                    title: "INICIAR SESIÓN / REGISTRARSE",
                    onTap: () => context.go('/registro'),
                  ),
                ],
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () => context.go('/registro'),
              child: const Text(
                "YA TIENES UNA CUENTA",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),

      // ===== BOTTOM NAV =====
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFE8C27D),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 0) context.go('/');
          if (index == 1) context.go('/pedidos'); // ✅ corregido
          if (index == 2) context.go('/registro');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: "Tienda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }

  // ===== ITEM MENÚ =====
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // ===== ITEM DRAWER =====
  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
