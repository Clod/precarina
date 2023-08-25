import 'package:flutter/cupertino.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:precarina/model/pressure_data.dart';

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

enum PatientDiagnosePas { patientDignoseHT2, patientDignoseHT1, patientDignoseHT, patientDignoseNorm }

enum PatientDiagnosePad { patientDignoseHT2, patientDignoseHT1, patientDignoseHT, patientDignoseNorm }

PatientDiagnosePas? patDiagPas;
PatientDiagnosePad? patDiagPad;

List<String> searchBloodPressurePercentiles({
  required PatientSex sex,
  required double height,
  required int age,
  required int sistBP,
  required int diastBP,
}) {
  String? diastBpPerc;
  String? sistBpPerc;
  int valorTablaSist = 0;
  int valorTablaDiast = 0;

  bool diastBelow = false;
  bool diastAvove = false;
  bool sistBelow = false;
  bool sistAvove = false;

  List<List<int>> sistPressMatrix;
  List<List<int>> diastPressMatrix;
  List<double> heightsMatrix;

  if (sex == PatientSex.female) {
    sistPressMatrix = femaleSistPressMatrix[age - 1];
    diastPressMatrix = femaleDiastPressMatrix[age - 1];
    heightsMatrix = femaleHeightsMatrix[age - 1];
  } else {
    sistPressMatrix = maleSistPressMatrix[age - 1];
    diastPressMatrix = maleDiastPressMatrix[age - 1];
    heightsMatrix = maleHeightsMatrix[age - 1];
  }

  // Percentile values in the table.
  var bpTablePercs = ['50', '90', '95', '95 + 12 mmHg'];

  String patientDignose;

  int col = 0;
  // A partir de la altura determino la columna a usar.
  // La edad determina la fila.
  if (height <= heightsMatrix[0]) {
    col = 0;
  } else if (height >= heightsMatrix[6]) {
    col = 6;
  } else {
    for (int i = 0; i < 6; i++) {
      // Voy comparando y me voy quedando
      if (height >= heightsMatrix[i] && height <= heightsMatrix[i + 1]) {
        col = i + 1;
        break;
      }
    }
  }

  // Ahora recorro las filas de la tabla de presiones diastólicas
  if (diastBP < diastPressMatrix[0][col]) {
    valorTablaDiast = diastPressMatrix[0][col];
    diastBpPerc = bpTablePercs[0];
    patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    diastBelow = true;
  } else if (diastBP == diastPressMatrix[0][col]) {
    valorTablaDiast = diastPressMatrix[0][col];
    patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    diastBpPerc = bpTablePercs[0];
  } else if (diastBP > diastPressMatrix[0][col] && diastBP <= diastPressMatrix[1][col]) {
    valorTablaDiast = diastPressMatrix[1][col];
    diastBpPerc = bpTablePercs[1];
    if (diastBP == diastPressMatrix[1][col]) {
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else {
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    }
  } else if (diastBP > diastPressMatrix[1][col] && diastBP <= diastPressMatrix[2][col]) {
    valorTablaDiast = diastPressMatrix[2][col];
    diastBpPerc = bpTablePercs[2];
    if (diastBP == diastPressMatrix[2][col]) {
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    }
  } else if (diastBP > diastPressMatrix[2][col] && diastBP <= diastPressMatrix[3][col]) {
    valorTablaDiast = diastPressMatrix[3][col];
    diastBpPerc = bpTablePercs[3];
    if (diastBP == diastPressMatrix[3][col]) {
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    } else {
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    }
  } else if (diastBP == diastPressMatrix[3][col]) {
    valorTablaDiast = diastPressMatrix[3][col];
    diastBpPerc = bpTablePercs[3];
    patDiagPad = PatientDiagnosePad.patientDignoseHT2;
  } else if (diastBP > diastPressMatrix[3][col]) {
    valorTablaDiast = diastPressMatrix[3][col];
    diastBpPerc = bpTablePercs[3];
    patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    diastAvove = true;
  }

  // Ahora recorro las filas de la tabla de presiones sistólicas
  if (sistBP < sistPressMatrix[0][col]) {
    valorTablaSist = sistPressMatrix[0][col];
    sistBpPerc = bpTablePercs[0];
    patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    sistBelow = true;
  } else if (sistBP == sistPressMatrix[0][col]) {
    valorTablaSist = sistPressMatrix[0][col];
    patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    sistBpPerc = bpTablePercs[0];
  } else if (sistBP > sistPressMatrix[0][col] && sistBP <= sistPressMatrix[1][col]) {
    valorTablaSist = sistPressMatrix[1][col];
    sistBpPerc = bpTablePercs[1];
    if (sistBP == sistPressMatrix[1][col]) {
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else {
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    }
  } else if (sistBP > sistPressMatrix[1][col] && sistBP <= sistPressMatrix[2][col]) {
    valorTablaSist = sistPressMatrix[2][col];
    sistBpPerc = bpTablePercs[2];
    if (sistBP == sistPressMatrix[2][col]) {
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    }
  } else if (sistBP > sistPressMatrix[2][col] && sistBP <= sistPressMatrix[3][col]) {
    valorTablaSist = sistPressMatrix[3][col];
    sistBpPerc = bpTablePercs[3];
    if (sistBP == sistPressMatrix[3][col]) {
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    } else {
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    }
  } else if (sistBP == sistPressMatrix[3][col]) {
    valorTablaSist = sistPressMatrix[3][col];
    sistBpPerc = bpTablePercs[3];
    patDiagPas = PatientDiagnosePas.patientDignoseHT2;
  } else if (sistBP > sistPressMatrix[3][col]) {
    valorTablaSist = sistPressMatrix[3][col];
    sistBpPerc = bpTablePercs[3];
    patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    sistAvove = true;
  }

/*
  Esto me lo mandó Marina por WhatsApp
  Paciente normotenso , ( serían los casos en que ambos valores son menores a percentilo 90)
  Paciente prehipertenso ( cuando uno o los dos valores dan igual a  90 y menor a 95)
  Paciente con hipertension estadio 1 ( cuando al menos un valor o los dos dan igual a  95 y menor a 95+12)
  Paciente con hipertensión estadio 2 (cuando al menos uno o los dos valores dan igual o más de 95+12)
*/

  if (patDiagPas == PatientDiagnosePas.patientDignoseHT2 || patDiagPad == PatientDiagnosePad.patientDignoseHT2) {
    patientDignose = patientDignoseHT2;
  } else if (patDiagPas == PatientDiagnosePas.patientDignoseHT1 || patDiagPad == PatientDiagnosePad.patientDignoseHT1) {
    patientDignose = patientDignoseHT1;
  } else if (patDiagPas == PatientDiagnosePas.patientDignoseHT || patDiagPad == PatientDiagnosePad.patientDignoseHT) {
    patientDignose = patientDignoseHT;
  } else {
    patientDignose = patientDignoseNorm;
  }

  debugPrint("Diagnóstico: $patientDignose");

  debugPrint("Altura tabla utilizada: ${heightsMatrix[col]}");
  debugPrint("PAS: $sistBP Perc Sistólica: $sistBpPerc basado en tabla: $valorTablaSist");
  debugPrint("PAD: $diastBP Perc Diastólica: $diastBpPerc basado en tabla: $valorTablaDiast");

  String result;
  // valorTablaSistA == 0 means patient's BP is not within a range but is below the lowest value
  if (sistBpPerc == bpTablePercs[0] && sistBelow == true) {
    result = resultPasUnder_50;
  } else if (sistBpPerc == bpTablePercs[0]) {
    result = resultPasEqual_50;
  } else if (sistBpPerc == bpTablePercs[1]) {
    result = resultPas_50to90;
  } else if (sistBpPerc == bpTablePercs[2]) {
    result = resultPas_90to95;
  } else if (sistBpPerc == bpTablePercs[3] && sistAvove == true) {
    result = resultPasAbove_95plus12;
  } else {
    result = resultPas_95to95plus12;
  }

  // valorTablaDiastA == 0 means patient's BP is not within a range but is below the lowest value
  if (diastBpPerc == bpTablePercs[0] && diastBelow == true) {
    result += resultPadUnder_50;
  } else if (diastBpPerc == bpTablePercs[0]) {
    result += resultPadEqual_50;
  } else if (diastBpPerc == bpTablePercs[1]) {
    result += resultPad_50to90;
  } else if (diastBpPerc == bpTablePercs[2]) {
    result += resultPad_90to95;
  } else if (diastBpPerc == bpTablePercs[3] && diastAvove == true) {
    result += resultPadAbove_95plus12;
  } else {
    result += resultPad_95to95plus12;
  }

  return [patientDignose, result];
}
