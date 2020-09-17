import 'package:Binarios/utils/potencia2.dart';

class ConversorBinario {
  int _decimal = 0;

  int binarioDecimal(List<int> lista, bool negativo) {
    for (int i = 0; i < lista.length; i++) {
      if (negativo ? lista[i] == 0 : lista[i] == 1) {
        int indice = lista.length - i - 1;
        _decimal += Potencia2().fazerPotencia(indice);
        print('Decimal $_decimal');
        indice = 0;
      }
    }
    return _decimal;
  }
}
