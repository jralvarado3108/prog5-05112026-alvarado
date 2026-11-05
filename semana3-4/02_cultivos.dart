mixin Regable {
  void regar(double litros) => print('   Riego aplicado: $litros L');
}

abstract class Cultivo {
  final String nombre;
  final double hectareas;
  Cultivo(this.nombre, this.hectareas);

  double rendimiento();
  String get unidad;

  String describir() => '$nombre: $hectareas ha -> ${rendimiento()} $unidad';
}

class Cacao extends Cultivo with Regable {
  Cacao(double ha) : super('Cacao', ha);
  @override
  double rendimiento() => hectareas * 12;
  @override
  String get unidad => 'quintales';
}

class Arroz extends Cultivo {
  Arroz(double ha) : super('Arroz', ha);
  @override
  double rendimiento() => hectareas * 60;
  @override
  String get unidad => 'sacas';
}

class Banano extends Cultivo with Regable {
  final int cajasPorHa;
  Banano(double ha, this.cajasPorHa) : super('Banano', ha);
  @override
  double rendimiento() => hectareas * cajasPorHa;
  @override
  String get unidad => 'cajas';
}

void main() {
  List<Cultivo> finca = [Cacao(13), Arroz(20), Banano(51, 2200)];
  for (final c in finca) {
    print(c.describir());
    if (c is Regable) (c as Regable).regar(1000);
  }
}
