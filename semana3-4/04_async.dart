Future<double> consultarPrecioCacao() async {
  // Simula una consulta 
  await Future.delayed(const Duration(seconds: 2)); // Simula un retraso
  return 150.0; // Precio por kilogramo
}

Future<double> consultarSinConexion() async {
  // Simula una consulta 
  await Future.delayed(const Duration(seconds: 1)); // Simula un retraso
  throw Exception('No hay conexión con la finca');
}

void main() async {
  print('1. Consultando precio del cacao...');
  final precio = await consultarPrecioCacao();
  print('2. Precio del cacao: $precio');

  try {
    await consultarSinConexion();
  } catch (e) {
    print('3. Error controlado: $e');
  }
  print('4. Fin del programa');
}