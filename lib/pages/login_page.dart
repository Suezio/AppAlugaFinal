import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_app/main.dart';
import 'package:projeto_app/models/anuncios.dart';
import 'package:projeto_app/pages/home_page.dart';
import 'package:projeto_app/repositories/Anuncio_Repositorio.dart';

import 'anuncios_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _form1 = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  enviar() {
    if (_form.currentState!.validate()) {
      //enviar mensagem
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mensagem Enviada =)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(' Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      // child: Image.asset(widget.anuncios.icone),
                      width: 200,
                    ),
                    Container(width: 10),
                    //trailing: Text(tabela[anuncios].preco.toString()),
                  ],
                ),
              ),
              Form(
                key: _form,
                child: TextFormField(
                  controller: _email,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    suffix: Text(
                      'Texto',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                ),
              ),
              Form(
                key: _form1,
                child: TextFormField(
                  controller: _senha,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.password),
                    suffix: Text(
                      'Texto',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _email.text, password: _senha.text)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage())));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Logar',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
