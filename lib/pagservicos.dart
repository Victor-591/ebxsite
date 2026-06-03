import 'package:flutter/material.dart';
import 'servicos.dart';

class PagServicos extends StatelessWidget {
  const PagServicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços realizados pela EBX:'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              'Serviços Oferecidos',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                Chip(label: Text('Aterramentos')),
                Chip(label: Text('Cabeamento')),
                Chip(label: Text('Disjuntores')),
                Chip(label: Text('Lâmpadas')),
                Chip(label: Text('Ventiladores')),
                Chip(label: Text('Ar-Condicionados')),
                Chip(label: Text('Refletores')),
                Chip(label: Text('Automação')),
                Chip(label: Text('Orçamentos')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}