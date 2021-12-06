import 'package:flutter/material.dart';
import 'package:projeto_app/pages/conta_page.dart';
import 'package:projeto_app/pages/detalhes.dart';
import 'package:projeto_app/pages/marcadas_page.dart';
import 'package:projeto_app/pages/anuncios_page.dart';
import 'package:projeto_app/pages/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 1;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          LoginPage(),
          anuncios_pages(),
          MarcadasPage(),
          //ContaPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          // BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Anuncios'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'Reservados'),
          // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Conta'),

          //BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Conta'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
        //backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
