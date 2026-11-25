
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/mensagens.dart';

class FirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'ebxsite',
  );

  Future<void> salvarMensagem(Mensagens mensagem) async {
    try {
      print('Conectando ao Firestore...');

      final documento = await db.collection('orcamentos').add({
        'nome': mensagem.nome,
        'email': mensagem.email,
        'mensagem': mensagem.mensagem,
        'dataCadastro': FieldValue.serverTimestamp(),
      });

      print('Mensagem salva com sucesso!');
      print('ID: ${documento.id}');
    } catch (e) {
      print('ERRO AO SALVAR: $e');
      rethrow;
    }
  }
}

