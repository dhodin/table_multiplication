import 'package:flutter/material.dart';
import 'package:table_multiplication/ecrans/ecranMultiplication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table de Multiplication',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const EcranAccueil(),
    );
  }
}
