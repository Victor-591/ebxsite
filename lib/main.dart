import 'package:flutter/material.dart';
import 'telas/inicio.dart';

void main() {
  runApp(const EBX());
}

class EBX extends StatelessWidget {
  const EBX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EBX: Comercial, Residencial e Industrial',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC107),
        useMaterial3: true,
      ),
      home: const Inicio(),
    );
  }
}
