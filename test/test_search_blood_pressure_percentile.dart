import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:precarina/aux_functions/search_blood_pressure_percentile.dart';
import 'package:precarina/model/precarina_model.dart';

String resultPasUnder_50 = "El percentilo de PAS determinado es menor a percentilo 50\n";
String resultPasEqual_50 = "El percentilo de PAS determinado es igual a 50\n";
String resultPas_50to90 = "El percentilo de PAS determinado está entre 50 y 90\n";
String resultPas_90to95 = "El percentilo de PAS determinado está entre 90 y 95\n";
String resultPas_95to95plus12 = "El percentilo de PAS determinado está entre 95 y 95 + 12 mmHg\n";
String resultPasAbove_95plus12 = "El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n";

String resultPadUnder_50 = "El percentilo de PAD determinado es menor a percentilo 50\n";
String resultPadEqual_50 = "El percentilo de PAD determinado es igual a 50\n";
String resultPad_50to90 = "El percentilo de PAD determinado está entre 50 y 90\n";
String resultPad_90to95 = "El percentilo de PAD determinado está entre 90 y 95\n";
String resultPad_95to95plus12 = "El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n";
String resultPadAbove_95plus12 = "El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n";

String patientDignoseHT2 = "Paciente con hipertensión estadio 2";
String patientDignoseHT1 = "Paciente con hipertensión estadio 1";
String patientDignoseHT = "Paciente prehipertenso";
String patientDignoseNorm = "Paciente normotenso";

void main() {
  test('searchBloodPressurePercentiles test', () {
    // Test case 1
    debugPrint("***************************************************************");
    debugPrint("Test 1.1");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.male,
        height: 125.0,
        age: 9,
        sistBP: 130,
        diastBP: 190,
      ),
      equals([
        'Paciente con hipertensión estadio 2',
        'El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n'
            'El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n'
      ]),
    );

    // Test case 2
    debugPrint("***************************************************************");
    debugPrint("Test 1.2");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.male,
        height: 125.0,
        age: 9,
        sistBP: 100,
        diastBP: 60,
      ),
      equals([
        'Paciente normotenso',
        'El percentilo de PAS determinado está entre 50 y 90\n'
            'El percentilo de PAD determinado está entre 50 y 90\n'
      ]),
    );

    // Test case 3
    debugPrint("***************************************************************");
    debugPrint("Test 1.3");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.male,
        height: 125.0,
        age: 9,
        sistBP: 108,
        diastBP: 72,
      ),
      equals([
        'Paciente prehipertenso',
        'El percentilo de PAS determinado está entre 90 y 95\n'
            'El percentilo de PAD determinado está entre 90 y 95\n'
      ]),
    );

    // Test case 4
    debugPrint("***************************************************************");
    debugPrint("Test 1.4");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.male,
        height: 125.0,
        age: 9,
        sistBP: 120,
        diastBP: 76,
      ),
      equals([
        'Paciente con hipertensión estadio 1',
        'El percentilo de PAS determinado está entre 95 y 95 + 12 mmHg\n'
            'El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n'
      ]),
    );
  });

  test('searchBloodPressurePercentiles test', () {
    // Test case 2.1
    debugPrint("***************************************************************");
    debugPrint("Test 2.1");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.male,
        height: 103.0,
        age: 3,
        sistBP: 107,
        diastBP: 63,
      ),
      equals([
        'Paciente prehipertenso',
        'El percentilo de PAS determinado está entre 90 y 95\n'
            'El percentilo de PAD determinado está entre 90 y 95\n'
      ]),
    );

    // Test case 2.2
    debugPrint("***************************************************************");
    debugPrint("Test 2.2");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.male,
        height: 162.0,
        age: 14,
        sistBP: 110,
        diastBP: 80,
      ),
      equals([
        "Paciente con hipertensión estadio 1",
        'El percentilo de PAS determinado está entre 50 y 90\n'
            'El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n'
      ]),
    );

    // Test case 2.3
    debugPrint("***************************************************************");
    debugPrint("Test 2.3");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.female,
        height: 142.0,
        age: 8,
        sistBP: 120,
        diastBP: 80,
      ),
      equals([
        "Paciente con hipertensión estadio 1",
        "El percentilo de PAS determinado está entre 95 y 95 + 12 mmHg\n"
            "El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n"
      ]),
    );

    // Test case 2.4
    debugPrint("***************************************************************");
    debugPrint("Test 2.4");
    expect(
      searchBloodPressurePercentiles(
        sex: PatientSex.female,
        height: 90.0,
        age: 6,
        sistBP: 125,
        diastBP: 86,
      ),
      equals([
        'Paciente con hipertensión estadio 2',
        'El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n'
            'El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n'
      ]),
    );
  });
}
