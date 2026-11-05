class Cosecha {
  String codigo;
  String finca;
  String cultivo;
  double kilogramos;

  Cosecha({
    this.codigo,
    this.finca,
    this.cultivo,
    this.kilogramos,
  });

  void mostrar(){
    print ('$codigo - $finca - $cultivo - $kilogramos');
  }
}