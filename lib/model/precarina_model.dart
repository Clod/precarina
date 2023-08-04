import 'package:flutter/material.dart';

class PrecarinaModel extends ChangeNotifier {

  int? dietValue;
  // int? _dietScoreValue;

  // int? get dietScoreValue => _dietScoreValue;

  // set dietScoreValue(int? value) {
  //   _dietScoreValue = value;
  //   notifyListeners();
  // }

  int? physicalActivityValue;
  int? smokeValue;
  int? sleepValue;
  int? bmiValue;
  int? cholesterolValue;
  int? diabetesValue;
  int? bloodPressureValue;

  double average = 0.0;

//  String? sex;
  PatientSex? patientSex;
  double? height;
  int? weightKilos;
  int? weightGrams;
  DateTime? dateOfBirth;
  int? ageYears;
  int? ageMonths;

  calculateAverage () {
    average = (dietValue != null) ? dietValue!.toDouble() : 0.0;
    notifyListeners(); // TODO: hace falta????
  }

  /// Internal, private state of the cart.
  /// Removes all items from the cart.
  void removeAll() {
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

enum PatientSex { male, female}