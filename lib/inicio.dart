import 'package:flutter/material.dart';
import 'sobre.dart';
import 'pagprojetos.dart';
import 'pagservicos.dart';
import 'contato.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EBX Instalações Elétricas'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              color: Colors.blue,
              child: const Column(
                children: [
                  Icon(Icons.lightbulb,
                      size: 90, color: Colors.black),
                  SizedBox(height: 15),
                  Text(
                    'EBX',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A melhor solução em Itapetininga!',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sobre()),
                );
              },
              child: const Text('Sobre'),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PagProjetos(),
                  ),
                );
              },
              child: const Text('Projetos'),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PagServicos(),
                  ),
                );
              },
              child: const Text('Serviços'),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContatoPage(),
                  ),
                );
              },
              child: const Text('Contato'),
            ),
          ],
        ),
      ),
    );
  }
}
