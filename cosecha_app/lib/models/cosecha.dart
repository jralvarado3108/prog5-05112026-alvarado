class Cosecha {
  final String codigo;
  final String finca;
  final String cultivo;
  double _kilogramos = 0;

  // Constructor con llaves
  Cosecha({required this.codigo, 
          required this.finca, 
          required this.cultivo, 
          required double kilogramos,
          }) {
        this.kilogramos = kilogramos; //pasa por el setter
  }

  Cosecha.vacia(String codigo)
      : this(codigo : codigo,
        finca : 'Sin Finca',
        cultivo : 'Sin Cultivo',
        kilogramos: 0);
      double get kilogramos => _kilogramos;

  set kilogramos(double valor) {
    if (valor < 0) {
      throw ArgumentError('Los kilogramos no pueden ser negativos');
    }
    _kilogramos = valor;
  }

  double get quintales => _kilogramos / 45.56;


  void mostrar() => print(
    '$codigo - $finca - $cultivo: $_kilogramos kg (${quintales.toStringAsFixed(1)} qq)');
  }
