import 'package:flutter/material.dart';

class ContaPage extends StatefulWidget {
  ContaPage({Key? key}) : super(key: key);

  @override
  _ContaPageState createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' Configurações'),
      ),
    );
  }
}
