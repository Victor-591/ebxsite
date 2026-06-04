import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: const [
                SizedBox(height: 20),

                Text(
                  'Quem somos?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'A EBX oferece serviços de instalação elétrica para residências,'
                      ' comércios e indústrias de Itapetininga e região. Há mais de dez anos no mercado,'
                      ' a EBX trabalha com materiais e parceiros de qualidade, além de ofertar orçamentos personalizados'
                      ' de acordo com a necessidade do cliente.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.8,
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