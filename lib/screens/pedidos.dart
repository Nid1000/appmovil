import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  // 🔹 Pedidos simulados (luego se conecta a BD)
  final List<Map<String, String>> pedidos = [
    {
      "id": "001",
      "fecha": "20/01/2026",
      "total": "S/ 35.00",
      "estado": "Entregado",
    },
    {
      "id": "002",
      "fecha": "25/01/2026",
      "total": "S/ 18.50",
      "estado": "En proceso",
    },
    {
      "id": "003",
      "fecha": "28/01/2026",
      "total": "S/ 52.00",
      "estado": "Pendiente",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EACB),

      // ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8C27D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/'),
        ),
        title: const Text(
          "Mis pedidos",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // ===== BODY =====
      body: pedidos.isEmpty
          ? _sinPedidos()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                return _pedidoCard(pedido);
              },
            ),
    );
  }

  // ===== TARJETA DE PEDIDO =====
  Widget _pedidoCard(Map<String, String> pedido) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pedido #${pedido['id']}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text("Fecha: ${pedido['fecha']}"),
            Text("Total: ${pedido['total']}"),

            const SizedBox(height: 6),

            Row(
              children: [
                const Text("Estado: "),
                Chip(
                  label: Text(
                    pedido['estado']!,
                    style: const TextStyle(color: Colors.black),
                  ),
                  backgroundColor: _estadoColor(pedido['estado']!),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ===== BOTONES =====
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _verDetalle(pedido);
                  },
                  child: const Text(
                    "VER DETALLE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===== SIN PEDIDOS =====
  Widget _sinPedidos() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.receipt_long, size: 80, color: Colors.brown),
          SizedBox(height: 12),
          Text(
            "No tienes pedidos aún",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ===== COLOR ESTADO =====
  Color _estadoColor(String estado) {
    switch (estado) {
      case "Entregado":
        return Colors.green.shade300;
      case "En proceso":
        return Colors.orange.shade300;
      default:
        return Colors.grey.shade400;
    }
  }

  // ===== DETALLE =====
  void _verDetalle(Map<String, String> pedido) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Pedido #${pedido['id']}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fecha: ${pedido['fecha']}"),
            Text("Total: ${pedido['total']}"),
            Text("Estado: ${pedido['estado']}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CERRAR"),
          ),
        ],
      ),
    );
  }
}
