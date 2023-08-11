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

//  String? sex;
  PatientSex? patientSex;
  double? height;
  int? weightKilos;
  int? weightGrams;
  DateTime? dateOfBirth;
  int? ageYears;
  int? ageMonths;

  calculateAverage() {
    if (dietValue != null &&
        physicalActivityValue != null &&
        smokeValue != null &&
        sleepValue != null &&
        bmiValue != null &&
        cholesterolValue != null &&
        diabetesValue != null &&
        bloodPressureValue != null) {
      average = (dietValue!.toDouble() +
              physicalActivityValue!.toDouble() +
              smokeValue!.toDouble() +
              sleepValue!.toDouble() +
              bmiValue!.toDouble() +
              cholesterolValue!.toDouble() +
              diabetesValue!.toDouble() +
              bloodPressureValue!.toDouble()) /
          8;
    }
    // Notify the changes to main_screen so it updates de linear gauges
    notifyListeners();
  }

  /// Internal, private state of the cart.
  /// Removes all items from the cart.
  void removeAll() {
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  @override
  String toString() {
    String patientData = "\nSex: $patientSex"
        "\nHeight: $height"
        "\nWeight Kilos: $weightKilos"
        "\nWeight Kilos: $weightGrams"
        "\nDate of Birth: ${dateOfBirth.toString().substring(0, 10)}"
        "\nAge Years: $ageYears"
        "\nAge Months: $ageMonths";

    return patientData;
  }
}

enum PatientSex { male, female }
