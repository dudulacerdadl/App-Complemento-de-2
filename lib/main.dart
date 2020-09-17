import 'package:Binarios/views/principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Principal(),
    );
  }
}
