import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_app/pages/detalhes.dart';
import 'package:projeto_app/pages/home_page.dart';
import 'package:projeto_app/pages/marcadas_page.dart';
import 'package:projeto_app/pages/anuncios_page.dart';
import 'package:projeto_app/pages/detalhes.dart';
import 'package:projeto_app/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritasRepository(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aluga-se',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}
