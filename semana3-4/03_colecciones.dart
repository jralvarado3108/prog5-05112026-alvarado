import 'cosecha.dart';

void main() {
  final cosecha = <Cosecha>[
    Cosecha(codigo: 'C001', finca:'La Esperanza', cultivo:'Arroz', kilogramos: 1200),
    Cosecha(codigo: 'C002', finca:'El Paraíso', cultivo:'Cacao', kilogramos: 800),
    Cosecha(codigo: 'C003', finca:'La Esperanza', cultivo:'Banano', kilogramos: 1500),
  ]; 

  //Set: finca sin repetir
  final fincas = cosecha.map((c)=> c.finca).toSet();
  print('Fincas: $fincas');

  //where: filtrar por cantidad cultivdad
  print('Cosechas con más de 900 kg:');
  cosecha.where((c)=> c.kilogramos > 900).forEach((c)=> c.mostrar());

  //fold: acumular
  final total = cosecha.fold<double>(0, (suma, c)=>suma+c.kilogramos);
  print('Total cosechado: $total kg');

  //Map: buscar por clave
  final porCodigo = {for (final c in cosecha) c.codigo: c};
  porCodigo['C002']?.mostrar();

}

