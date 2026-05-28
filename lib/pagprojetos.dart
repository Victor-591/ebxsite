import 'package:flutter/material.dart';
import 'projetos.dart';

class PagProjetos extends StatelessWidget {
  const PagProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projetos Finalizados'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/imagens/aterramento.png',
                height: 250,
                fit: BoxFit.contain,
              ),
                ),

                const ListTile(
                  title: Text('Aterramento'),
                  subtitle: Text(
                    'Processo realizado para proteger uma construção de descargas elétricas.',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/imagens/andaime.png',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),

                const ListTile(
                  title: Text('Refletores'),
                  subtitle: Text(
                    'Instalação de refletores utilizando andaimes.',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/imagens/tomadas.png',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),

                const ListTile(
                  title: Text('Estrutura para tomadas'),
                  subtitle: Text(
                    'Uma estrutura para alimentar geladeiras em um comércio.',
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
