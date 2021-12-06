import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_app/models/anuncios.dart';
import 'Anuncio_Repositorio.dart';

class FavoritasRepository extends ChangeNotifier {
  List<Anuncios> _list = [];

  UnmodifiableListView<Anuncios> get lista => UnmodifiableListView(_list);

  saveAll(List<Anuncios> anuncio) {
    anuncio.forEach((anuncios) {
      if (!_list.contains(anuncio)) _list.add(anuncios);
    });
    notifyListeners();
  }

  remove(Anuncios anuncios) {
    _list.remove(anuncios);
    notifyListeners();
  }
}
