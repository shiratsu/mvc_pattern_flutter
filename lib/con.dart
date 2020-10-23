import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

import 'model.dart';

class Con extends ControllerMVC {
  Con([StateMVC state]) : super(state) {
    data = Model();
  }
  Model data;

  int get length => data.length;

  void addAll(int count){
    data.addAll(count);
  }
  String something(int index){
    return data.wordPair(index);
  }

  bool contains(String something){
    return data.contains(something);
  }

  void somethingHappens(String something){
    data.save(something);
  }

  Iterable<ListTile> mapHappens<ListTile>(Function f){
    return data.saved(f);
  }
}
