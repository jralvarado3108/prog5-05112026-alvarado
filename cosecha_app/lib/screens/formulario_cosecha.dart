import 'package:flutter/material.dart';
import '../models/cosecha.dart';

class FormularioCosecha extends StatefulWidget{
  const FormularioCosecha({super.key});

  @override
  State<FormularioCosecha> createState() => _FormularioCosechaState();
}

class _FormularioCosechaState extends State<FormularioCosecha>{
  final _formKey = GlobalKey<FormState>();
  final _codigoCtrl = TextEditingController();
  final _fincaCtrl = TextEditingController();
  final _cultivoCtrl = TextEditingController();
  final _kgCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    debugPrint('initState: Se creo la pantalla de formulario de cosecha');
  }

  @override
  void dispose() {
    //Liberacion implicita de memoria de los controladores
    _codigoCtrl.dispose();
    _fincaCtrl.dispose();
    _cultivoCtrl.dispose();
    _kgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Cosecha')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _codigoCtrl,
                decoration: const InputDecoration(labelText: 'Código (ej: C006)'),
                validator: (v) => (v==null || v.trim().isEmpty) ? 'Por favor ingrese un código' : null,
              ),
              TextFormField(
                controller: _fincaCtrl,
                decoration: const InputDecoration(labelText: 'Finca'),
                validator: (v) => (v==null || v.trim().isEmpty) ? 'Por favor ingrese el nombre de finca' : null,
              ),
            
              TextFormField(
                controller: _cultivoCtrl,
                decoration: const InputDecoration(labelText: 'Cultivo'),
                validator: (v) => (v==null || v.trim().isEmpty) ? 'Por favor ingrese el cultivo' : null,
              ),
              TextFormField(
                controller: _kgCtrl,
                decoration: const InputDecoration(labelText: 'Kilogramos'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final kg = double.tryParse(v ?? '');
                  if (kg == null) return 'Por :  favor ingrese un número válido';
                  if (kg < 0) return 'Los kilogramos no pueden ser negativos';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final cosecha = Cosecha(
                      codigo: _codigoCtrl.text.trim(),
                      finca: _fincaCtrl.text.trim(),
                      cultivo: _cultivoCtrl.text.trim(),
                      kilogramos: double.parse(_kgCtrl.text.trim()),
                    );
                    Navigator.pop(context, cosecha);
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
