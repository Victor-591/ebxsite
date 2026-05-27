import 'package:flutter/material.dart';

class CardProjeto extends StatelessWidget {
  final String titulo;
  final String descricao;

  const CardProjeto({super.key, required this.titulo, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(titulo), subtitle: Text(descricao)),
    );
  }
}
