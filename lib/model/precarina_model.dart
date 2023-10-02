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

  bool showGreenSmiley = false;
  bool showRedSmiley = false;
  bool showYellowSmiley = false;

  double? average;

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
      if (average! < 33) {
        showRedSmiley = true;
      } else if (average! > 66) {
        showGreenSmiley = true;
      } else {
        showYellowSmiley = true;
      }
    } else {
      average = null;
    }
    // Notify the changes to main_screen so it updates de linear gauges
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

  void resetValues() {
    dietValue = null;
    physicalActivityValue = null;
    smokeValue = null;
    sleepValue = null;
    bmiValue = null;
    cholesterolValue = null;
    diabetesValue = null;
    bloodPressureValue = null;
    average = null;
    showGreenSmiley = false;
    showRedSmiley = false;
    showYellowSmiley = false;
    notifyListeners();
  }
}

enum PatientSex { male, female }
