// lib/screens/estadisticas_cosecha.dart
import 'package:flutter/material.dart';
import '../models/cosecha.dart';

class EstadisticasCosecha extends StatelessWidget {
  final List<Cosecha> cosechas;

  const EstadisticasCosecha({super.key, required this.cosechas});

  @override
  Widget build(BuildContext context) {
    // Calculamos totales generales
    final totalKg = cosechas.fold<double>(0, (s, c) => s + c.kilogramos);
    final totalQq = cosechas.fold<double>(0, (s, c) => s + c.quintales);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas y Resumen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Tarjeta de resumen general
            Card(
              elevation: 3,
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumen General de Producción',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text('Total Registros: ${cosechas.length}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 6),
                    Text('Peso Total: ${totalKg.toStringAsFixed(0)} kg', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 6),
                    Text('Equivalente: ${totalQq.toStringAsFixed(1)} qq', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Detalle de Cosechas Registradas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // Tabla de datos (DataTable)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Código')),
                  DataColumn(label: Text('Cultivo')),
                  DataColumn(label: Text('Finca')),
                  DataColumn(label: Text('Kg')),
                  DataColumn(label: Text('Qq')),
                ],
                rows: cosechas.map((c) {
                  return DataRow(cells: [
                    DataCell(Text(c.codigo)),
                    DataCell(Text(c.cultivo)),
                    DataCell(Text(c.finca)),
                    DataCell(Text(c.kilogramos.toStringAsFixed(0))),
                    DataCell(Text(c.quintales.toStringAsFixed(1))),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}