import 'package:flutter/material.dart';
import '../models/cosecha.dart';

class DetalleCosecha extends StatelessWidget {
  final Cosecha cosecha;

  const DetalleCosecha({super.key, required this.cosecha});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cosecha: ${cosecha.codigo}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Card(
          color: colores.surfaceContainerLow,
          child: Padding(
            padding:const EdgeInsets.all(20.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Finca: ${cosecha.finca}', style: textos.titleMedium),
            const SizedBox(height: 8),
            Text('Cultivo: ${cosecha.cultivo}', style: textos.bodyLarge),
            const SizedBox(height: 8),
            Text(
              'Kilogramos: ${cosecha.kilogramos.toStringAsFixed(0)} kg',
              style: textos.bodyLarge,
            ),
            const SizedBox(height: 24),
            Text(
              'Quintales: ${cosecha.quintales.toStringAsFixed(1)} qq',
              style: textos.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colores.primary,
              ),
            ),
          ],
        ),
      ),
        ),
      ),
    );
    
  }
}
