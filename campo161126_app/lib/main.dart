import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:typed_data'; //permite guardar la foto como byte
import 'package:image_picker/image_picker.dart'; //selector de imagen 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reporte de Campo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ReporteCampo(),
    );
  }
}

class ReporteCampo extends StatefulWidget {
  const ReporteCampo({super.key});  
  
  @override
  State<ReporteCampo> createState() => _ReporteCampoState();
}

class _ReporteCampoState extends State<ReporteCampo> {
  String _ubicacion = "Sin ubicación";
  Uint8List? _foto;

  Future<void> _tomarFoto() async {
    final img = await ImagePicker().pickImage(
      source: ImageSource.camera, //abrir la camara
      maxWidth: 800,
      );
      if (img==null) return; //el usuario cancelo tomar la foto
      final bytes = await img.readAsBytes();
      setState(()=> _foto = bytes);
  }

  Future<void> _obtenerUbicacion() async {
    var permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission(); 
  }
  if (permiso == LocationPermission.denied || 
      permiso == LocationPermission.deniedForever) {
    setState(() => _ubicacion = "Permiso denegado");
    return; 
  }
  final pos = await Geolocator.getCurrentPosition();
  setState(()=>_ubicacion = 
    'Lat: ${pos.latitude.toStringAsFixed(5)}\n'
    'Lon: ${pos.longitude.toStringAsFixed(5)}');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Campo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 64, color: Colors.green),
            Text(_ubicacion, 
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _obtenerUbicacion,
            icon: const Icon(Icons.gps_fixed),
            label: const Text('Obtener ubicación'),
            ),
          const SizedBox (height: 16),
          OutlinedButton.icon(
            onPressed: _tomarFoto, 
            icon: const Icon(Icons.photo_camera),
            label: const Text('Tomar foto'),
            ),
            const SizedBox(height: 16),
            if(_foto!=null) Image.memory(_foto!, height: 200,), //esta linea indica que si hay una foto que se muestre



          ],
        ),
      ),
    ); 
  }
}
