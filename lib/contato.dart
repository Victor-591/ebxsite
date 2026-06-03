import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();

  Future<void> salvarPedido() async {
    await FirebaseFirestore.instance.collection('orcamentos').add({
      'nome': nomeController.text.trim(),
      'email': emailController.text.trim(),
      'mensagem': mensagemController.text.trim(),
      'dataCadastro': Timestamp.now(),
      'status': 'Novo',
    });
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
    const Color fundo = Color(0xFF0F172A);
    const Color destaque = Color(0xFF6366F1);
    const Color texto = Color(0xFFE2E8F0);

    return Scaffold(
      backgroundColor: fundo,

      appBar: AppBar(
        backgroundColor: fundo,
        foregroundColor: texto,
        elevation: 0,
        centerTitle: true,
        title: const Text('Pedido'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),

            child: Column(
              children: [

                const Text(
                  'Entre em contato para realizar um orçamento.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: texto,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                Card(
                  color: Colors.white10,
                  child: const ListTile(
                    leading: Icon(
                      Icons.camera_alt,
                      color: destaque,
                    ),
                    title: Text(
                      '@ebx_eletrica2023',
                      style: TextStyle(color: texto),
                    ),
                    subtitle: Text(
                      'Instagram',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Card(
                  color: Colors.white10,
                  child: const ListTile(
                    leading: Icon(
                      Icons.email,
                      color: destaque,
                    ),
                    title: Text(
                      'ebx2023@outlook.com',
                      style: TextStyle(color: texto),
                    ),
                    subtitle: Text(
                      'E-mail',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Card(
                  color: Colors.white10,
                  child: const ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: destaque,
                    ),
                    title: Text(
                      '(15) 98804-5866',
                      style: TextStyle(color: texto),
                    ),
                    subtitle: Text(
                      'Telefone',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: nomeController,
                  style: const TextStyle(color: texto),

                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle:
                    const TextStyle(color: Colors.white70),

                    filled: true,
                    fillColor: Colors.white10,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: emailController,
                  keyboardType:
                  TextInputType.emailAddress,
                  style: const TextStyle(color: texto),

                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle:
                    const TextStyle(color: Colors.white70),

                    filled: true,
                    fillColor: Colors.white10,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: mensagemController,
                  maxLines: 5,
                  style: const TextStyle(color: texto),

                  decoration: InputDecoration(
                    labelText:
                    'Orçamentos, sugestões, críticas...',
                    labelStyle:
                    const TextStyle(color: Colors.white70),

                    filled: true,
                    fillColor: Colors.white10,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: destaque,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),

                    onPressed: () async {

                      if (nomeController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          mensagemController.text.isEmpty) {

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Preencha todos os campos.',
                            ),
                          ),
                        );

                        return;
                      }

                      try {

                        await salvarPedido();

                        nomeController.clear();
                        emailController.clear();
                        mensagemController.clear();

                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Solicitação enviada com sucesso!',
                            ),
                          ),
                        );

                      } catch (e) {

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              'Erro ao enviar: $e',
                            ),
                          ),
                        );

                      }
                    },

                    child: const Text(
                      'Enviar Solicitação',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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