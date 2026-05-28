import 'package:flutter/material.dart';
import 'servicos.dart';

class PagServicos extends StatelessWidget {
  const PagServicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços realizados pela EBX:'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CardServico(nome: 'Manutenções elétricas'),
          CardServico(nome: 'Aterramentos'),
          CardServico(nome: 'Instalações (Refletores, Lâmpadas, Ar-Condicionados, etc'),
          CardServico(nome: 'Orçamentos'),
          CardServico(nome: 'Cabeamentos'),
          CardServico(nome: 'Tomadas'),
        ],
      ),
    );
  }
}
