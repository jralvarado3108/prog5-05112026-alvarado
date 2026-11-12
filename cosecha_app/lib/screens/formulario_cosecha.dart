// lib/screens/formulario_cosecha.dart
import 'package:flutter/material.dart';
import '../models/cosecha.dart';

class FormularioCosecha extends StatefulWidget {
  const FormularioCosecha({super.key});

  @override
  State<FormularioCosecha> createState() => _FormularioCosechaState();
}

class _FormularioCosechaState extends State<FormularioCosecha> {
  final _formKey = GlobalKey<FormState>();

  final _codigoCtrl = TextEditingController();
  final _fincaCtrl = TextEditingController();
  final _cultivoCtrl = TextEditingController();
  final _kgCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    debugPrint('initState: Se creó la pantalla del formulario');
  }

  @override
  void dispose() {
    // Liberación explícita de controladores en memoria
    _codigoCtrl.dispose();
    _fincaCtrl.dispose();
    _cultivoCtrl.dispose();
    _kgCtrl.dispose();
    debugPrint('dispose: Se liberaron los controladores de texto');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Nueva Cosecha')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _codigoCtrl,
                decoration: const InputDecoration(labelText: 'Código (ej. C006)'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Ingrese el código' : null,
              ),
              TextFormField(
                controller: _fincaCtrl,
                decoration: const InputDecoration(labelText: 'Nombre de la Finca'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Ingrese la finca' : null,
              ),
              TextFormField(
                controller: _cultivoCtrl,
                decoration: const InputDecoration(labelText: 'Cultivo (ej. Cacao)'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Ingrese el cultivo' : null,
              ),
              TextFormField(
                controller: _kgCtrl,
                decoration: const InputDecoration(labelText: 'Kilogramos'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final kg = double.tryParse(v ?? '');
                  if (kg == null) return 'Ingrese un número válido';
                  if (kg < 0) return 'Los kilogramos no pueden ser negativos';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nueva = Cosecha(
                      codigo: _codigoCtrl.text.trim(),
                      finca: _fincaCtrl.text.trim(),
                      cultivo: _cultivoCtrl.text.trim(),
                      kilogramos: double.parse(_kgCtrl.text),
                    );
                    // Regresamos enviando el objeto de retorno
                    Navigator.pop(context, nueva);
                  }
                },
                child: const Text('Guardar Cosecha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

