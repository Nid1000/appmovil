import 'package:flutter/material.dart';

class BoletaPage extends StatelessWidget {
  const BoletaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boleta"),
        backgroundColor: const Color(0xFFE8C27D),
      ),
      backgroundColor: const Color(0xFFF2EACB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _item("Pan francés", 2, 1.00),
            _item("Torta de chocolate", 1, 15.00),

            const Divider(height: 40),

            _totalRow("TOTAL", 17.00),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text("CONFIRMAR COMPRA"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String nombre, int cantidad, double precio) {
    return ListTile(
      title: Text(nombre),
      subtitle: Text("Cantidad: $cantidad"),
      trailing: Text("S/ ${(cantidad * precio).toStringAsFixed(2)}"),
    );
  }

  Widget _totalRow(String label, double total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text("S/ ${total.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
