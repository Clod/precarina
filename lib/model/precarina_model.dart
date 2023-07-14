import 'package:flutter/material.dart';

class PrecarinaModel extends ChangeNotifier {

  int? dietValue;
  int? physicalActivityValue;
  int? smokeValue;
  int? sleepValue;
  int? bmiValue;
  int? cholesterolValue;
  int? diabetesValue;
  int? bloodPressureValue;

  double average = 0.0;

  calculateAverage () {
    average = (dietValue != null) ? dietValue! * 10 : 0.0;
    notifyListeners();
  }

  /// Internal, private state of the cart.
  /// Removes all items from the cart.
  void removeAll() {
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}