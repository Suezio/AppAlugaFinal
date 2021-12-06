import 'package:flutter/material.dart';
import 'package:projeto_app/main.dart';
import 'package:projeto_app/models/anuncios.dart';
import 'package:projeto_app/repositories/Anuncio_Repositorio.dart';

class Detalhes extends StatefulWidget {
  Anuncios anuncios;

  Detalhes({Key? key, required this.anuncios}) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

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
          title: Text(widget.anuncios.nome),
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
                      child: Image.asset(widget.anuncios.icone),
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
                  controller: _valor,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mensagem',
                    prefixIcon: Icon(Icons.sms),
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
                  onPressed: enviar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Enviar',
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
