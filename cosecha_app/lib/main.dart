
import 'package:flutter/material.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text('Contador de cajas')),
        body: const Center(child: ContadorCajas()),
      ),
    );
  }
}

class ContadorCajas extends StatefulWidget {
  const ContadorCajas({super.key});

  @override
  State<ContadorCajas> createState() => _ContadorCajasState();
}

class _ContadorCajasState extends State<ContadorCajas> {
  int _cajas = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Cajas: $_cajas', style: const TextStyle(fontSize: 32)),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => _cajas++),
          child: const Text('Agregar caja'),
        ),
      ],
    );
  }
}