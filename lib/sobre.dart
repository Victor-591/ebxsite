import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'A EBX atende a região de Itapetininga com instalações elétricas de qualidade!'
          'Com atendimento personalizado e orçamentos ',
        ),
      ),
    );
  }
}
