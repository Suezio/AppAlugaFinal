import 'package:flutter/material.dart';
import 'package:projeto_app/models/anuncios.dart';
import 'package:projeto_app/pages/detalhes.dart';
import 'package:projeto_app/repositories/Anuncio_Repositorio.dart';
import 'package:projeto_app/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';
//import  'package: intl / intl.dart';

class anuncios_pages extends StatefulWidget {
  anuncios_pages({Key? key}) : super(key: key);

  @override
  _anuncios_pagesState createState() => _anuncios_pagesState();
}

class _anuncios_pagesState extends State<anuncios_pages> {
  final tabela = AnuncioRepositorio.tabela;

  List<Anuncios> selecionadas = [];
  late FavoritasRepository favoritas;

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        centerTitle: true,
        title: Text('Anuncios'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
        ),
        centerTitle: true,
        title: Text('${selecionadas.length} selecionados'),
        backgroundColor: Colors.blue,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  mostrarDetalhes(Anuncios anuncios) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Detalhes(anuncios: anuncios),
        ));
  }

  limparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    //favoritas = Provider.of<FavoritasRepository>(context);
    favoritas = context.watch<FavoritasRepository>();

    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int anuncios) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            leading: (selecionadas.contains(tabela[anuncios]))
                ? CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(tabela[anuncios].icone),
                    width: 60,
                  ),
            title: Row(
              children: [
                Text(tabela[anuncios].nome,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    )),
                if (favoritas.lista.contains(tabela[anuncios]))
                  Icon(Icons.circle, color: Colors.amber, size: 8),
              ],
            ),

            trailing: Text(tabela[anuncios].preco.toString()),
            //trailing: Text(inteiro.format(tabela[anuncios].preco)),
            selected: selecionadas.contains(tabela[anuncios]),
            selectedTileColor: Colors.deepOrange[50],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[anuncios]))
                    ? selecionadas.remove(tabela[anuncios])
                    : selecionadas.add(tabela[anuncios]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[anuncios]),
          );
        },
        padding: EdgeInsets.all(20),
        separatorBuilder: (_, __) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                favoritas.saveAll(selecionadas);
                limparSelecionadas();
              },
              icon: Icon(Icons.check),
              label: Text(
                'Alugar',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
