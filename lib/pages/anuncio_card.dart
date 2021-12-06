import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_app/models/anuncios.dart';
import 'package:projeto_app/pages/anuncios_page.dart';
import 'package:projeto_app/pages/detalhes.dart';
import 'package:projeto_app/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AnuncioCard extends StatefulWidget {
  Anuncios anuncios;

  AnuncioCard({Key? key, required this.anuncios}) : super(key: key);

  @override
  _AnuncioCardState createState() => _AnuncioCardState();
}

class _AnuncioCardState extends State<AnuncioCard> {
  //NumberFormat real = NumberFormat(locale: 'pt_BR', name: 'R\$');

  static Map<String, Color> precoColor = <String, Color>{
    'up': Colors.teal,
    'down': Colors.indigo,
  };

  abrirDetalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Detalhes(anuncios: widget.anuncios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
          onTap: () => abrirDetalhes(),
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Row(
              children: [
                Image.asset(
                  widget.anuncios.icone,
                  height: 40,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.anuncios.nome,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Text(
                        // widget.anuncios.preco,
                        //style: TextStyle(
                        //  fontSize: 13,
                        // color: Colors.black45,

                        //)
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: precoColor['down']!.withOpacity(0.05),
                    border: Border.all(
                      color: precoColor['down']!.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    (widget.anuncios.preco),
                    style: TextStyle(
                      fontSize: 16,
                      color: precoColor['down'],
                      letterSpacing: -1,
                    ),
                  ),
                ),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('Remover produto'),
                        onTap: () {
                          Navigator.pop(context);
                          Provider.of<FavoritasRepository>(context,
                                  listen: false)
                              .remove(widget.anuncios);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
