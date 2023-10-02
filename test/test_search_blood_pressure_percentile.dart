import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:precarina/aux_functions/search_blood_pressure_percentile_db.dart';
import 'package:precarina/model/precarina_model.dart';

import 'package:flutter/widgets.dart';


String resultPasUnder_50 = "El percentilo de PAS determinado es menor a percentilo 50\n";
String resultPasEqual_50 = "El percentilo de PAS determinado es igual a 50\n";
String resultPas_50to90 = "El percentilo de PAS determinado está entre 50 y 90\n";
String resultPas_90to95 = "El percentilo de PAS determinado está entre 90 y 95\n";
String resultPas_95to95plus12 = "resultPas_95to95plus12";
String resultPasAbove_95plus12 = "El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n";

String resultPadUnder_50 = "El percentilo de PAD determinado es menor a percentilo 50\n";
String resultPadEqual_50 = "El percentilo de PAD determinado es igual a 50\n";
String resultPad_50to90 = "El percentilo de PAD determinado está entre 50 y 90\n";
String resultPad_90to95 = "El percentilo de PAD determinado está entre 90 y 95\n";
String resultPad_95to95plus12 = "El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n";
String resultPadAbove_95plus12 = "El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n";

String patientDiagnoseHT2 = "Paciente con hipertensión estadio 2";
String patientDiagnoseHT1 = "Paciente con hipertensión estadio 1";
String patientDiagnoseHT = "Paciente prehipertenso";
String patientDiagnoseNorm = "Paciente normotenso";

void main() async {

  group('Math operations', () {
    test('searchBloodPressurePercentiles test', () async {
      // Test case 1
      debugPrint("***************************************************************");
      debugPrint("Test 1.1");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.male,
          height: 125.0,
          age: 9,
          systBP: 190,
          diastBP: 130,
        ),
        equals([
          'patientDiagnoseHT2',
          'resultPasAbove_95plus12'
              'resultPadAbove_95plus12'
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
          systBP: 100,
          diastBP: 60,
        ),
        equals([
          'patientDiagnoseNorm',
          'resultPas_50to90'
              'resultPad_50to90'
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
          systBP: 108,
          diastBP: 72,
        ),
        equals([
          'patientDiagnoseHT',
          'resultPas_90to95'
              'resultPad_90to95'
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
          systBP: 120,
          diastBP: 76,
        ),
        equals([
          'patientDiagnoseHT1',
          'resultPas_95to95plus12'
              'resultPad_95to95plus12'
        ]),
      );
    });
  });

  group('Math operations', () {
    test('searchBloodPressurePercentiles test', () {
      // Test case 2.1
      debugPrint("***************************************************************");
      debugPrint("Test 2.1");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.male,
          height: 103.0,
          age: 3,
          systBP: 107,
          diastBP: 63,
        ),
        equals([
          'patientDiagnoseHT',
          'resultPas_90to95'
              'resultPad_90to95'
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
          systBP: 110,
          diastBP: 80,
        ),
        equals([
          "patientDiagnoseHT1",
          'resultPas_50to90'
              'resultPad_95to95plus12'
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
          systBP: 120,
          diastBP: 80,
        ),
        equals([
          "patientDiagnoseHT1",
          "resultPas_95to95plus12"
              "resultPad_95to95plus12"
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
          systBP: 125,
          diastBP: 86,
        ),
        equals([
          'patientDiagnoseHT2',
          'resultPasAbove_95plus12'
              'resultPadAbove_95plus12'
        ]),
      );
    });
  });

  group('Tests ', () {
    test('searchBloodPressurePercentiles test', () {
      // Test case 3.1
      debugPrint("***************************************************************");
      debugPrint("Test 3.1");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.male,
          height: 170.0,
          age: 13,
          systBP: 100,
          diastBP: 60,
        ),
        equals([
          'patientDiagnoseNorm',
          'resultPasUnder_50'
              'resultPadUnder_50'
        ]),
      );
    });
  });

  group('Test 16 & 16+ yars old ', () {
    test('searchBloodPressurePercentiles test', () {
      // Test case 4.1
      debugPrint("***************************************************************");
      debugPrint("Test 4.1");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.female,
          height: 150.0,
          age: 16,
          systBP: 165,
          diastBP: 105,
        ),
        equals([
          'patientDiagnoseHT2',
          'resultAgeOver16'
        ]),
      );
    });

    test('searchBloodPressurePercentiles test', () {
      // Test case 4.2
      debugPrint("***************************************************************");
      debugPrint("Test 4.2");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.male,
          height: 180.0,
          age: 16,
          systBP: 126,
          diastBP: 70,
        ),
        equals([
          'patientDiagnoseNorm',
          'resultAgeOver16'
        ]),
      );
    });

    test('searchBloodPressurePercentiles test', () {
      // Test case 4.3
      debugPrint("***************************************************************");
      debugPrint("Test 4.3");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.female,
          height: 150.0,
          age: 16,
          systBP: 142,
          diastBP: 70,
        ),
        equals([
          'patientDiagnoseHT1',
          'resultAgeOver16'
        ]),
      );
    });

    test('searchBloodPressurePercentiles test', () {
      // Test case 4.4
      debugPrint("***************************************************************");
      debugPrint("Test 4.4");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.female,
          height: 160.0,
          age: 17,
          systBP: 154,
          diastBP: 90,
        ),
        equals([
          'patientDiagnoseHT1',
          'resultAgeOver16'
        ]),
      );
    });

    test('searchBloodPressurePercentiles test', () {
      // Test case 4.5
      debugPrint("***************************************************************");
      debugPrint("Test 4.5");
      expect(
        searchBloodPressurePercentiles(
          sex: PatientSex.male,
          height: 160.0,
          age: 16,
          systBP: 182,
          diastBP: 110,
        ),
        equals([
          'patientDiagnoseHT3',
          'resultAgeOver16'
        ]),
      );
    });
  });
}
