
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mensagens.dart';

class FirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> salvarMensagem(Mensagens mensagem) async {
    try {
      print('Tentando conectar ao Firestore...');

      final documento = await db.collection('orcamentos').add({
        'nome': mensagem.nome,
        'email': mensagem.email,
        'mensagem': mensagem.mensagem,
        'dataCadastro': FieldValue.serverTimestamp(),
      });

      print('Mensagem salva com sucesso!');
      print('ID do documento: ${documento.id}');
    } catch (e) {
      print('ERRO NO FIREBASE: $e');
      rethrow;
    }
  }
}
