
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'inicio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Teste de conexão com o banco Firestore "ebxsite"
    print('TESTANDO CONEXÃO COM FIRESTORE...');

    final firestore = FirebaseFirestore.instanceFor(
      app: Firebase.app(),
      databaseId: 'ebxsite',
    );

    await firestore.collection('Teste').limit(1).get();

    print('FIRESTORE CONECTADO COM SUCESSO!');

    runApp(const EBX());
  } catch (e) {
    print('ERRO AO INICIALIZAR OU CONECTAR AO FIREBASE: $e');

    runApp(AppErro(erro: e.toString()));
  }
}

class EBX extends StatelessWidget {
  const EBX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EBX',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFFFC107),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F172A),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0F172A),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const Inicio(),
    );
  }
}

class AppErro extends StatelessWidget {
  final String erro;

  const AppErro({super.key, required this.erro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Não foi possível inicializar o Firebase.\n\n$erro',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}


