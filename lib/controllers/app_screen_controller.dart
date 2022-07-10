import 'package:flutter/cupertino.dart';

class AppScreenController extends ChangeNotifier {
  int index = 0;
  // getters
  int get getIndex => index;
  // setters
  void changeIndex(int changedIndex) {
    index = changedIndex;
    notifyListeners();
  }
}
