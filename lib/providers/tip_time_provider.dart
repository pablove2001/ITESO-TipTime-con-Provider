import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var costController = TextEditingController();
  bool isSelected = false;
  int? _selectedRadio = null;
  int? get getSelectionRadio => _selectedRadio;
  var radioGroupValues = {
    20: "amazing 20%",
    18: "Good 18%",
    15: "Ok 15%",
  };
  double tipAmount = 0;

  void tipCalculation(int dato) {
    tipAmount = dato * 3;
  }

  void setIsSelected(bool switchValue) {
    isSelected = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? value) {
    _selectedRadio = value;
    notifyListeners();
  }
}
