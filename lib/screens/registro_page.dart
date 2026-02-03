import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController apellidoCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController telefonoCtrl = TextEditingController();
  final TextEditingController direccionCtrl = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    nombreCtrl.dispose();
    apellidoCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    telefonoCtrl.dispose();
    direccionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EACB),

      // ===== APP BAR CON FLECHA =====
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8C27D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go('/'); // 👈 vuelve al INICIO
          },
        ),
        title: const Text(
          "Crear cuenta",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // ===== BODY =====
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 80,
                    color: Colors.brown,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Regístrate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _inputRow(
                    _inputField(
                      controller: nombreCtrl,
                      label: "Nombre",
                      icon: Icons.person,
                    ),
                    _inputField(
                      controller: apellidoCtrl,
                      label: "Apellido",
                      icon: Icons.person_outline,
                    ),
                  ),

                  const SizedBox(height: 14),

                  _inputField(
                    controller: emailCtrl,
                    label: "Correo electrónico",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 14),

                  _inputField(
                    controller: passwordCtrl,
                    label: "Contraseña",
                    icon: Icons.lock,
                    obscure: true,
                  ),

                  const SizedBox(height: 14),

                  _inputRow(
                    _inputField(
                      controller: telefonoCtrl,
                      label: "Teléfono",
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    _inputField(
                      controller: direccionCtrl,
                      label: "Dirección",
                      icon: Icons.location_on,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ===== BOTÓN REGISTRARSE =====
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8C27D),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: _loading ? null : _registrar,
                      child: _loading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : const Text(
                              "REGISTRARSE",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ===== LOGIN =====
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text(
                      "¿Ya tienes una cuenta? Inicia sesión",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ===== REGISTRO =====
  void _registrar() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registro exitoso 🎉"),
        backgroundColor: Colors.green,
      ),
    );

    context.go('/');
  }

  // ===== INPUT =====
  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF7E6B5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Campo obligatorio";
        }
        if (label == "Correo electrónico" && !value.contains("@")) {
          return "Correo inválido";
        }
        if (label == "Contraseña" && value.length < 6) {
          return "Mínimo 6 caracteres";
        }
        return null;
      },
    );
  }

  // ===== FILA =====
  Widget _inputRow(Widget left, Widget right) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 12),
        Expanded(child: right),
      ],
    );
  }
}
