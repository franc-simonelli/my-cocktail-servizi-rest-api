import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {

  int _index = 0;
  final PageController _controller = PageController(initialPage: 0);
  
  int get index => _index;
  PageController get controller => _controller;

  void changeIndex(int value){
    _index = value;
    notifyListeners();
  }
}