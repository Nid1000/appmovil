import 'package:flutter/material.dart';

class ProyectosPage extends StatelessWidget {
  const ProyectosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Pedidos"),
        backgroundColor: const Color(0xFFE8C27D),
      ),
      backgroundColor: const Color(0xFFF2EACB),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _pedidoCard("Pedido #001", "Entregado", "S/ 17.00"),
          _pedidoCard("Pedido #002", "En proceso", "S/ 10.00"),
        ],
      ),
    );
  }

  Widget _pedidoCard(String codigo, String estado, String total) {
    return Card(
      child: ListTile(
        title: Text(codigo),
        subtitle: Text("Estado: $estado"),
        trailing: Text(total),
      ),
    );
  }
}
