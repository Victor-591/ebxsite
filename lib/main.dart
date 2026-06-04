import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EBX());
}

class EBX extends StatelessWidget {
  const EBX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EBX',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC107),
        useMaterial3: true,
      ),
      home: const Inicio(),
    );
  }
}
