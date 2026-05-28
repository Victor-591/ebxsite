import 'package:flutter/material.dart';

class CardServico extends StatelessWidget {
  final String nome;

  const CardServico({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nome),
      ),
    );
  }
}
