
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();

  String tipoSelecionado = 'Orçamento';
  bool enviando = false;

  static const Color azulMarinho = Color(0xFF0F172A);
  static const Color azul = Color(0xFF2563EB);
  static const Color fundo = Color(0xFFF1F5F9);
  static const Color texto = Color(0xFF334155);

  final FirebaseFirestore db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'ebxsite',
  );

  Future<void> abrirLink(String endereco) async {
    final Uri url = Uri.parse(endereco);

    try {
      final resultado = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!resultado && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Não foi possível abrir o endereço.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao abrir o aplicativo.'),
        ),
      );
    }
  }

  Future<void> salvarPedido() async {
    try {
      print('Salvando orçamento no banco ebxsite...');

      final documento = await db.collection('orcamentos').add({
        'nome': nomeController.text.trim(),
        'email': emailController.text.trim(),
        'mensagem': mensagemController.text.trim(),
        'tipoSolicitacao': tipoSelecionado,
        'dataCadastro': FieldValue.serverTimestamp(),
        'status': 'Novo',
      });

      print('ORÇAMENTO SALVO COM SUCESSO!');
      print('ID DO DOCUMENTO: ${documento.id}');
    } catch (e) {
      print('ERRO AO SALVAR ORÇAMENTO: $e');
      rethrow;
    }
  }

  Future<void> enviarMensagem() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      enviando = true;
    });

    try {
      await salvarPedido();

      if (!mounted) return;

      nomeController.clear();
      emailController.clear();
      mensagemController.clear();

      setState(() {
        tipoSelecionado = 'Orçamento';
        enviando = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Solicitação enviada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        enviando = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Não foi possível enviar sua solicitação. Tente novamente.',
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget cardContato({
    required IconData icone,
    required String titulo,
    required String descricao,
    required String endereco,
  }) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: azul.withValues(alpha: 0.10),
          child: Icon(icone, color: azul),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: azulMarinho,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          descricao,
          style: const TextStyle(color: texto),
        ),
        trailing: const Icon(
          Icons.open_in_new,
          color: azul,
          size: 20,
        ),
        onTap: () => abrirLink(endereco),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    mensagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        title: const Text('Contato'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fale conosco!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: azulMarinho,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Entre em contato com a EBX pelos nossos canais de atendimento.',
                  style: TextStyle(fontSize: 15, color: texto),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Nossos contatos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: azulMarinho,
                  ),
                ),
                const SizedBox(height: 10),
                cardContato(
                  icone: Icons.camera_alt,
                  titulo: 'Instagram',
                  descricao: '@ebx_eletrica2023',
                  endereco: 'https://www.instagram.com/ebx_eletrica2023/',
                ),
                cardContato(
                  icone: Icons.email,
                  titulo: 'E-mail',
                  descricao: 'ebx2023@outlook.com',
                  endereco: 'mailto:ebx2023@outlook.com',
                ),
                cardContato(
                  icone: Icons.phone,
                  titulo: 'Telefone',
                  descricao: '(15) 98804-5866',
                  endereco: 'tel:+5515988045866',
                ),
                const SizedBox(height: 30),
                const Text(
                  'Envie sua mensagem',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: azulMarinho,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fale conosco (sugestões, orçamentos, etc...',
                  style: TextStyle(fontSize: 15, color: texto),
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nomeController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                            ),
                            validator: (valor) {
                              if (valor == null || valor.trim().isEmpty) {
                                return 'Informe seu nome.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                            ),
                            validator: (valor) {
                              if (valor == null || valor.trim().isEmpty) {
                                return 'Informe seu e-mail.';
                              }

                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                                  .hasMatch(valor.trim())) {
                                return 'Informe um e-mail válido.';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          DropdownButtonFormField<String>(
                            initialValue: tipoSelecionado,
                            decoration: const InputDecoration(
                              labelText: 'Tipo de solicitação',
                              prefixIcon: Icon(Icons.assignment_outlined),
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Orçamento',
                                child: Text('Solicitar orçamento'),
                              ),
                              DropdownMenuItem(
                                value: 'Sugestão',
                                child: Text('Enviar sugestão'),
                              ),
                            ],
                            onChanged: (valor) {
                              if (valor != null) {
                                setState(() {
                                  tipoSelecionado = valor;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            controller: mensagemController,
                            maxLines: 5,
                            maxLength: 1000,
                            decoration: const InputDecoration(
                              labelText: 'Sua mensagem',
                              hintText: 'Descreva sua solicitação...',
                              alignLabelWithHint: true,
                              prefixIcon: Icon(Icons.message_outlined),
                              border: OutlineInputBorder(),
                            ),
                            validator: (valor) {
                              if (valor == null || valor.trim().isEmpty) {
                                return 'Digite sua mensagem.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: enviando ? null : enviarMensagem,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: azulMarinho,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: enviando
                                  ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                                  : const Icon(Icons.send),
                              label: Text(
                                enviando ? 'Enviando...' : 'Enviar mensagem',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

