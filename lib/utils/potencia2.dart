class Potencia2 {
  int _expoente;
  int _potencia = 1;

  int fazerPotencia(int novoExpoente) {
    this._expoente = novoExpoente;
    for (int i = 0; i < _expoente; i++) {
      _potencia *= 2;
      print('Potência $_potencia');
    }
    return _potencia;
  }
}
