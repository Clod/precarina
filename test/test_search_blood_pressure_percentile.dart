import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:precarina/aux_functions/search_blood_pressure_percentile.dart';
import 'package:precarina/model/precarina_model.dart';

void main() {
  test('searchBloodPressurePercentiles test', () {
    // Test case 1
    debugPrint("Test 1");
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
    debugPrint("Test 2");
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
    debugPrint("Test 3");
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
    debugPrint("Test 4");
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
}
