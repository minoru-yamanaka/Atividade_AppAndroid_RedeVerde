//pega os itens

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foto/models/place.dart';
import 'dart:math';

class GreatePlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items]; //não retorna diretamente para a lista
  }

  int get itemsCount {
    return _items.length; //os itens virão para este trecho.
  }

  Place itemByIndex(int index) {
    return _items[index]; //os dados retorna pelo id
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}

