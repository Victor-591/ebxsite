import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fale conosco:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('Telefone: (15) 98804-5866'),
            SizedBox(height: 10),
            Text('E-mail: Brunogacl20@gmail.com'),
            SizedBox(height: 20),
            Text('Instagram: @ebx_eletrica2023'),
            SizedBox(height: 10),
            Text('Endereço: Rua Indalécio Alves, 137 - PQ. São Bento - Itapetininga/SP'),
          ],
        ),
      ),
    );
  }
}
