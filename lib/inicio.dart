import 'package:flutter/material.dart';
import 'sobre.dart';
import 'projetos.dart';
import 'servicos.dart';
import 'contato.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EBX Instalações Elétricas'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            color: Colors.amber,
            child: const Column(children: [
              Icon(Icons.electrical_services, size: 90, color: Colors.black),
              SizedBox(height: 15),
              Text('EBX', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Instalações elétricas residenciais, comerciais e industriais.', textAlign: TextAlign.center),
            ]),
          ),
        ]),
      ),
    );
  }
}
