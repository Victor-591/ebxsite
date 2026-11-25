
import 'package:cloud_firestore/cloud_firestore.dart';

class Mensagens {
  String nome;
  String email;
  String mensagem;
  Timestamp dataCadastro;

  Mensagens({
    required this.nome,
    required this.email,
    required this.mensagem,
    required this.dataCadastro,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'mensagem': mensagem,
      'dataCadastro': dataCadastro,
    };
  }

  factory Mensagens.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    final dados = snapshot.data();

    if (dados == null) {
      throw Exception('Documento sem dados.');
    }

    return Mensagens(
      nome: dados['nome'] ?? '',
      email: dados['email'] ?? '',
      mensagem: dados['mensagem'] ?? '',
      dataCadastro: dados['dataCadastro'] ?? Timestamp.now(),
    );
  }
}
