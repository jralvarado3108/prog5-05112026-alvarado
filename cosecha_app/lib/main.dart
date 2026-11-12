import 'package:flutter/material.dart';
import 'models/cosecha.dart';
import 'screens/detalle_cosecha.dart';
import 'screens/formulario_cosecha.dart'; // <-- Importación necesaria

void main() => runApp(const CosechaApp());

class CosechaApp extends StatelessWidget {
  const CosechaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosechas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: const ListaCosechas(),
    );
  }
}

class ListaCosechas extends StatefulWidget {
  const ListaCosechas({super.key});

  @override
  State<ListaCosechas> createState() => _ListaCosechasState();
}

class _ListaCosechasState extends State<ListaCosechas> {
  final List<Cosecha> _cosechas = [
    Cosecha(codigo: 'C001', finca: 'La Esperanza', cultivo: 'Arroz', kilogramos: 1200),
    Cosecha(codigo: 'C002', finca: 'El Progreso', cultivo: 'Cacao', kilogramos: 350),
    Cosecha(codigo: 'C003', finca: 'La Esperanza', cultivo: 'Banano', kilogramos: 950),
    Cosecha(codigo: 'C004', finca: 'El Triunfo', cultivo: 'Cafe', kilogramos: 400),
    Cosecha(codigo: 'C005', finca: 'El Progreso', cultivo: 'Cacao', kilogramos: 500),
  ];

  Future<void> _abrirFormulario() async {
    final nueva = await Navigator.push<Cosecha>(
      context,
      MaterialPageRoute(
        builder: (_) => const FormularioCosecha(),
      ),
    );

    if (nueva != null) {
      setState(() {
        _cosechas.add(nueva);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _cosechas.fold<double>(0, (s, c) => s + c.kilogramos);
    return Scaffold(
      appBar: AppBar(title: Text('Cosechas: ${total.toStringAsFixed(0)} kg')),
      body: ListView.builder(
        itemCount: _cosechas.length,
        itemBuilder: (context, i) {
          final c = _cosechas[i];
          return ListTile(
            leading: const Icon(Icons.agriculture),
            title: Text('${c.cultivo} · ${c.finca}'),
            subtitle: Text('${c.codigo} · ${c.quintales.toStringAsFixed(1)} qq'),
            trailing: Text('${c.kilogramos.toStringAsFixed(0)} kg'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleCosecha(cosecha: c),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirFormulario,
        child: const Icon(Icons.add),
      ),
    );
  }
}