///
import 'package:flutter/material.dart';

class PagServicos extends StatelessWidget {
  const PagServicos({super.key});

  static const Color azulMarinho = Color(0xFF0F172A);
  static const Color azul = Color(0xFF2563EB);
  static const Color fundo = Color(0xFFF1F5F9);
  static const Color texto = Color(0xFF334155);

  final List<Map<String, dynamic>> servicos = const [
    {
      'nome': 'Aterramentos',
      'descricao':
          'Instalação de sistemas de aterramento para oferecer maior segurança às instalações elétricas.',
      'icone': Icons.electrical_services,
    },
    {
      'nome': 'Cabeamento',
      'descricao':
          'Instalação e organização de cabeamentos utilizados na distribuição de energia elétrica.',
      'icone': Icons.cable,
    },
    {
      'nome': 'Disjuntores',
      'descricao':
          'Instalação e substituição de disjuntores para proteção dos circuitos elétricos.',
      'icone': Icons.power,
    },
    {
      'nome': 'Lâmpadas',
      'descricao':
          'Instalação e substituição de lâmpadas e pontos de iluminação em diferentes ambientes.',
      'icone': Icons.lightbulb,
    },
    {
      'nome': 'Ventiladores',
      'descricao':
          'Instalação de ventiladores, proporcionando mais conforto e circulação de ar nos ambientes.',
      'icone': Icons.toys,
    },
    {
      'nome': 'Ar-condicionado',
      'descricao':
          'Execução de instalações elétricas necessárias para o funcionamento de equipamentos de ar-condicionado.',
      'icone': Icons.ac_unit,
    },
    {
      'nome': 'Refletores',
      'descricao':
          'Instalação de refletores para iluminação de áreas internas e externas.',
      'icone': Icons.highlight,
    },
    {
      'nome': 'Automação',
      'descricao':
          'Instalação de soluções de automação para facilitar o controle de iluminação e equipamentos.',
      'icone': Icons.settings_remote,
    },
    {
      'nome': 'Orçamentos',
      'descricao':
          'Avaliação das necessidades do cliente e elaboração de orçamentos para serviços elétricos.',
      'icone': Icons.request_quote,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nossos serviços',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: azulMarinho,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'A EBX oferece serviços de instalações elétricas '
                  'residenciais, comerciais e industriais, atendendo '
                  'Itapetininga e região.',
                  style: TextStyle(
                    fontSize: 16,
                    color: texto,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 25),

                LayoutBuilder(
                  builder: (context, constraints) {
                    double largura;

                    if (constraints.maxWidth >= 850) {
                      largura = (constraints.maxWidth - 24) / 3;
                    } else if (constraints.maxWidth >= 550) {
                      largura = (constraints.maxWidth - 12) / 2;
                    } else {
                      largura = constraints.maxWidth;
                    }

                    return Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: servicos.map((servico) {
                        return SizedBox(
                          width: largura,
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    servico['icone'] as IconData,
                                    size: 35,
                                    color: azul,
                                  ),

                                  const SizedBox(height: 15),

                                  Text(
                                    servico['nome'] as String,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: azulMarinho,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    servico['descricao'] as String,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: texto,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: fundo,
    );
  }
}