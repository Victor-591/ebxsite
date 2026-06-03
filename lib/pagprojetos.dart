import 'package:flutter/material.dart';
import 'projetos.dart';

class PagProjetos extends StatelessWidget {
  const PagProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria de Projetos'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int colunas = constraints.maxWidth > 900 ? 2 : 1;

          return GridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: colunas,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [

              _cardProjeto(
                'assets/imagens/aterramento.png',
                'Aterramento',
                'Processo realizado para proteger uma construção de descargas elétricas.',
              ),

              _cardProjeto(
                'assets/imagens/andaime.png',
                'Refletores',
                'Instalação de refletores utilizando andaimes.',
              ),

              _cardProjeto(
                'assets/imagens/tomadas.png',
                'Estrutura para tomadas',
                'Uma estrutura para alimentar geladeiras em um comércio.',
              ),

              _cardProjeto(
                'assets/imagens/disjuntor.png',
                'Disjuntor',
                'Quadro de energia organizado.',
              ),

              _cardProjeto(
                'assets/imagens/camera.png',
                'Câmera de Segurança',
                'Aparelho para monitoramento.',
              ),

              _cardProjeto(
                'assets/imagens/lampadas.png',
                'Lâmpadas',
                'Iluminação interna.',
              ),

              _cardProjeto(
                'assets/imagens/caixa.png',
                'Controlador de Energia',
                'Uma opção prática.',
              ),

              _cardProjeto(
                'assets/imagens/caixa.png',
                'Controlador de Energia',
                'Uma opção prática.',
              ),

              _cardProjeto(
                'assets/imagens/caixa.png',
                'Controlador de Energia',
                'Uma opção prática.',
              ),

              _cardProjeto(
                'assets/imagens/caixa.png',
                'Controlador de Energia',
                'Uma opção prática.',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _cardProjeto(
    String imagem,
    String titulo,
    String descricao,
  ) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Image.asset(
              imagem,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          ListTile(
            title: Text(titulo),
            subtitle: Text(descricao),
          ),
        ],
      ),
    );
  }
}