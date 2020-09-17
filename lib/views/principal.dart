import 'package:Binarios/utils/conversor_binario.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final _form = GlobalKey<FormState>();
  String cmp2 = '';

  Future<void> _saveForm() async {
    bool isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }

    _form.currentState.save();

    List<String> doisString = cmp2.split('');
    List<int> lista = [];

    if (!cmp2.contains(new RegExp(r'[2-9]'))) {
      String resposta;
      bool negativo = false;
      int decimal = 0;
      int decimalFinal = 0;
      for (int i = 0; i < doisString.length; i++) {
        lista.add(int.parse(doisString[i]));
        print("Número ${lista[i]}");
      }

      int primeiroDecimal = ConversorBinario().binarioDecimal(lista, negativo);
      decimal = primeiroDecimal;

      if (lista[0] == 1) {
        negativo = true;
        primeiroDecimal--;
        for (var i = 0; i < primeiroDecimal; i++) {
          int indice = lista.length - i - 1;
          lista[indice] = primeiroDecimal % 2;
          double teste = primeiroDecimal / 2;
          primeiroDecimal = teste.toInt();
        }
        decimalFinal = ConversorBinario().binarioDecimal(lista, negativo);
      }

      !negativo
          ? resposta =
              'O valor em decimal continua sendo ${decimal.toString()}, levando em consideração a codificação com complemento de 2'
          : resposta =
              'O valor em decimal, levando em consideração a codificação com complemento de 2, é: -${decimalFinal.toString()}';

      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Seu número em decimal é ${decimal.toString()}'),
          content: Text(resposta),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ocorreu um erro!'),
          content: Text('Digite um número binário válido!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Complemento de 2'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () =>
                launch('https://github.com/dudulacerdadl/App-Complemento-de-2'),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    height: 150,
                    width: deviceSize.width * 0.75,
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Número binário'),
                            keyboardType: TextInputType.number,
                            onSaved: (value) => cmp2 = value,
                            onFieldSubmitted: (_) => _saveForm(),
                            validator: null,
                          ),
                          Spacer(),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Theme.of(context).primaryColor,
                            textColor:
                                Theme.of(context).primaryTextTheme.button.color,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 8,
                            ),
                            child: Text('Converter'),
                            onPressed: () => _saveForm(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
