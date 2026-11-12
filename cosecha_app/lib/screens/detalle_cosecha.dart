import 'package:flutter/material.dart';
import '../models/cosecha.dart';

class DetalleCosecha extends StatelessWidget {
  final Cosecha cosecha;

  const DetalleCosecha({super.key, required this.cosecha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cosecha: ${cosecha.codigo}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Finca: ${cosecha.finca}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Cultivo: ${cosecha.cultivo}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              'Kilogramos: ${cosecha.kilogramos.toStringAsFixed(0)} kg',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Quintales: ${cosecha.quintales.toStringAsFixed(1)} qq',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
