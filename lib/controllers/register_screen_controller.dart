import 'package:flutter/material.dart';

class RegisterScreenController extends ChangeNotifier{

  bool loading = false;

  // getters

  bool get getLoading => loading;

  // setters

  void startLoading(){
    loading = true;
    notifyListeners();
  }

  void stopLoading(){
    loading = false;
    notifyListeners();
  }

}