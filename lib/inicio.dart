///
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lightbulb,
                      size: 65,
                      color: Color(0xFF2563EB),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'EBX',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 45),


                SizedBox(
                  width: 240,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sobre(),
                        ),
                      );
                    },
                    child: const Text('Sobre'),
                  ),
                ),

                const SizedBox(height: 15),


                SizedBox(
                  width: 240,
                  child: ElevatedButton(
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
                ),

                const SizedBox(height: 15),


                SizedBox(
                  width: 240,
                  child: ElevatedButton(
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
                ),

                const SizedBox(height: 15),


                SizedBox(
                  width: 240,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContatoPage(),
                        ),
                      );
                    },
                    child: const Text('Contato'),
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
