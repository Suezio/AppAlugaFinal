import 'package:flutter/material.dart';
import 'package:projeto_app/models/anuncios.dart';
import 'package:projeto_app/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';

import 'anuncio_card.dart';

class MarcadasPage extends StatefulWidget {
  MarcadasPage({Key? key}) : super(key: key);

  @override
  _MarcadasPageState createState() => _MarcadasPageState();
}

class _MarcadasPageState extends State<MarcadasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' Alugar'),
      ),
      body: Container(
          color: Colors.indigo.withOpacity(0.05),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(12.0),
          child: Consumer<FavoritasRepository>(
              builder: (context, favoritas, child) {
            return favoritas.lista.isEmpty
                ? ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Ainda não há produtos'),
                  )
                : ListView.builder(
                    itemCount: favoritas.lista.length,
                    itemBuilder: (_, index) {
                      return AnuncioCard(anuncios: favoritas.lista[index]);
                    },
                  );
          })),
    );
  }
}
