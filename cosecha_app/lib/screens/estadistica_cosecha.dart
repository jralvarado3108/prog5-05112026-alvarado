import 'package:flutter/material.dart';
import '../models/cosecha.dart';

class EstadisticasCosecha extends StatelessWidget {
  final List<Cosecha> cosechas;

  const EstadisticasCosecha({super.key, required this.cosechas});

  @override
  Widget build(BuildContext context) {
    // 1. Cálculos generales
    final totalKg = cosechas.fold<double>(0, (s, c) => s + c.kilogramos);
    final totalQq = cosechas.fold<double>(0, (s, c) => s + c.quintales);

    // 2. Agrupar kilogramos por tipo de cultivo para el gráfico
    final Map<String, double> cultivoKgMap = {};
    for (var c in cosechas) {
      cultivoKgMap.update(c.cultivo, (value) => value + c.kilogramos, ifAbsent: () => c.kilogramos);
    }

    // Encontrar el valor máximo para calcular las proporciones de las barras
    double maxKg = 1.0;
    if (cultivoKgMap.isNotEmpty) {
      maxKg = cultivoKgMap.values.reduce((a, b) => a > b ? a : b);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas y Gráficos'),
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

            // Sección del Gráfico Estadístico de Barras (Nativo)
            const Text(
              'Producción por Cultivo (kg)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: cultivoKgMap.entries.map((entry) {
                    final cultivo = entry.key;
                    final kg = entry.value;
                    // Proporción de la barra (0.1 a 1.0)
                    final proporcion = kg / maxKg;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cultivo, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text('${kg.toStringAsFixed(0)} kg', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          // Barra de progreso visual personalizada
                          Stack(
                            children: [
                              Container(
                                height: 16,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FractionallySizedBox(
                                widthFactor: proporcion.clamp(0.05, 1.0),
                                child: Container(
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade600,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sección de la Tabla de Datos
            const Text(
              'Detalle de Cosechas Registradas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
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