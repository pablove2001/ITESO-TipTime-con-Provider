import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var costController = TextEditingController();

  int? _selectedRadio = null;
  int? get getSelectionRadio => _selectedRadio;
  var radioGroupValues = {
    20: "amazing 20%",
    18: "Good 18%",
    15: "Ok 15%",
  };

  bool _isSelected = false;
  bool get getIsSelected => _isSelected;

  double _tipAmount = 0;
  double get getTipAmount => _tipAmount;

  void tipCalculation(BuildContext context) {
    if (costController.text == '' || _selectedRadio == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Hay campos vacios'),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    double dato = double.parse(costController.text);
    _tipAmount = (dato * _selectedRadio!) / 100 + dato;

    if (_isSelected) {
      _tipAmount = _tipAmount.ceil() * 1.0;
    } else {
      _tipAmount = double.parse(_tipAmount.toStringAsFixed(2));
    }

    notifyListeners();
  }

  void setIsSelected(bool switchValue) {
    _isSelected = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? value) {
    _selectedRadio = value;
    // print(_selectedRadio);
    notifyListeners();
  }
}
