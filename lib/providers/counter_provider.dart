import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

  int _myCounter = 0;

  int get counter => _myCounter;

  addCounter(){
    _myCounter++;
    notifyListeners();
  }

}