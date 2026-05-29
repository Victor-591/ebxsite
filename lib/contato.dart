import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  ContatoPage({super.key});

  final TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Fale conosco:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text('Telefone: (15) 98804-5866'),

            const SizedBox(height: 10),

            const Text('E-mail: Brunogacl20@gmail.com'),

            const SizedBox(height: 20),

            const Text('Instagram: ebxeletrica2023@outlook.com'),

            const SizedBox(height: 10),

            const Text(
              'Endereço: Rua Indalécio Alves, 137 - PQ. São Bento - Itapetininga/SP',
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nomeController,

              decoration: const InputDecoration(
                labelText: 'Mande seu orçamento!',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () {

                String nome = nomeController.text;

                print("Salvando no banco: $nome");


                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Registro Salvo! $nome"),
                  ),
                );
              },

              child: const Text("Registrar solicitação"),
            ),
          ],
        ),
      ),
    );
  }
}