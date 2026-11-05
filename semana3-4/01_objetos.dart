import 'cosecha.dart';

void main() {
  var c1 = Cosecha(
    codigo:'C001', finca: 'Finca La Esperanza', cultivo:'Arroz', kilogramos: 1200.0);
  var c2 = Cosecha.vacia('C002');
  var c3 = Cosecha(
    codigo:'C003', cultivo:'Maíz', finca: 'Finca El Progreso', kilogramos: 20.0);
  var c4 = Cosecha(
    codigo:'C004', finca:'Finca La Esperanza', cultivo:'Frijol', kilogramos: 500.0);
  var c5 = Cosecha(kilogramos:40.0, codigo:'C005', cultivo:'Pitahaya', finca:'Sexto Semestre');
  
  // Para visualizar los datos en consola:
  c1.mostrar();
  c2.mostrar();
  c3.mostrar();
  c4.mostrar();
  c5.mostrar();

  try{
    c3.kilogramos = -20; // Intento de asignar un valor negativo
  } on ArgumentError catch (e) {
    print('Error: ${e.message}');
  }
  
}