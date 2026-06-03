import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> salvarProjeto({
    required String nome,
    required String descricao,
  }) async {
    await _db.collection('projetos').add({
      'nome': nome,
      'descricao': descricao,
      'dataCriacao': Timestamp.now(),
    });
  }
}