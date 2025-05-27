import 'package:flutter/widgets.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:precarina/model/pressure_data.dart';
import 'package:precarina/l10n/app_localizations.dart';

// String resultPasUnder_50 = "El percentilo de PAS determinado es menor a percentilo 50\n";
// String resultPasEqual_50 = "El percentilo de PAS determinado es igual a 50\n";
// String resultPas_50to90 = "El percentilo de PAS determinado está entre 50 y 90\n";
// String resultPas_90to95 = "El percentilo de PAS determinado está entre 90 y 95\n";
// String resultPas_95to95plus12 = "El percentilo de PAS determinado está entre 95 y 95 + 12 mmHg\n";
// String resultPasAbove_95plus12 = "El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n";
//
// String resultPadUnder_50 = "El percentilo de PAD determinado es menor a percentilo 50\n";
// String resultPadEqual_50 = "El percentilo de PAD determinado es igual a 50\n";
// String resultPad_50to90 = "El percentilo de PAD determinado está entre 50 y 90\n";
// String resultPad_90to95 = "El percentilo de PAD determinado está entre 90 y 95\n";
// String resultPad_95to95plus12 = "El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n";
// String resultPadAbove_95plus12 = "El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n";
//
// String patientDiagnoseHT2 = "Paciente con hipertensión estadio 2";
// String patientDiagnoseHT1 = "Paciente con hipertensión estadio 1";
// String patientDiagnoseHT = "Paciente prehipertenso";
// String patientDiagnoseNorm = "Paciente normotenso";

enum PatientDiagnosePas { patientDiagnoseHT2, patientDiagnoseHT1, patientDiagnoseHT, patientDiagnoseNorm }

enum PatientDiagnosePad { patientDiagnoseHT2, patientDiagnoseHT1, patientDiagnoseHT, patientDiagnoseNorm }

PatientDiagnosePas? patDiagPas;
PatientDiagnosePad? patDiagPad;

List<String> searchBloodPressurePercentiles({
  required BuildContext context,
  required PatientSex sex,
  required double height,
  required int age,
  required int sistBP,
  required int diastBP,
}) {
  final l10n = AppLocalizations.of(context)!;

  debugPrint("Entrando a la función");

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

  String patientDiagnose;

  debugPrint("Preguntanto edad");

  if (age >= 16) {
    if (sistBP < 130 && diastBP < 85) {
      patientDiagnose = l10n.patientDiagnoseNorm;
    } else if (sistBP <= 139 && diastBP <= 89) {
      patientDiagnose = l10n.patientDiagnoseHT;
    } else if (sistBP <= 159 && diastBP <= 99) {
      patientDiagnose = l10n.patientDiagnoseHT1;
    } else if (sistBP <= 179 && diastBP <= 109) {
      patientDiagnose = l10n.patientDiagnoseHT2;
    } else {
      patientDiagnose = l10n.patientDiagnoseHT3;
    }

    return [patientDiagnose, l10n.resultAgeOver16];
  }

  debugPrint("Es menor que 16");

  if (sex == PatientSex.female) {
    debugPrint("Es mujer");
    sistPressMatrix = femaleSistPressMatrix[age - 1];
    diastPressMatrix = femaleDiastPressMatrix[age - 1];
    heightsMatrix = femaleHeightsMatrix[age - 1];
  } else {
    debugPrint("Es varón");
    sistPressMatrix = maleSistPressMatrix[age - 1];
    diastPressMatrix = maleDiastPressMatrix[age - 1];
    heightsMatrix = maleHeightsMatrix[age - 1];
  }

  // Percentile values in the table.
  var bpTablePercs = ['50', '90', '95', '95 + 12 mmHg'];

  int col = 0;

  debugPrint("Determinando altura");
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

  debugPrint("Altura determinada");

  // Ahora recorro las filas de la tabla de presiones diastólicas
  if (diastBP < diastPressMatrix[0][col]) {
    valorTablaDiast = diastPressMatrix[0][col];
    diastBpPerc = bpTablePercs[0];
    patDiagPad = PatientDiagnosePad.patientDiagnoseNorm;
    diastBelow = true;
  } else if (diastBP == diastPressMatrix[0][col]) {
    valorTablaDiast = diastPressMatrix[0][col];
    patDiagPad = PatientDiagnosePad.patientDiagnoseNorm;
    diastBpPerc = bpTablePercs[0];
  } else if (diastBP > diastPressMatrix[0][col] && diastBP <= diastPressMatrix[1][col]) {
    valorTablaDiast = diastPressMatrix[1][col];
    diastBpPerc = bpTablePercs[1];
    if (diastBP == diastPressMatrix[1][col]) {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT;
    } else {
      patDiagPad = PatientDiagnosePad.patientDiagnoseNorm;
    }
  } else if (diastBP > diastPressMatrix[1][col] && diastBP <= diastPressMatrix[2][col]) {
    valorTablaDiast = diastPressMatrix[2][col];
    diastBpPerc = bpTablePercs[2];
    if (diastBP == diastPressMatrix[2][col]) {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT1;
    } else {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT;
    }
  } else if (diastBP > diastPressMatrix[2][col] && diastBP <= diastPressMatrix[3][col]) {
    valorTablaDiast = diastPressMatrix[3][col];
    diastBpPerc = bpTablePercs[3];
    if (diastBP == diastPressMatrix[3][col]) {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT2;
    } else {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT1;
    }
  } else if (diastBP == diastPressMatrix[3][col]) {
    valorTablaDiast = diastPressMatrix[3][col];
    diastBpPerc = bpTablePercs[3];
    patDiagPad = PatientDiagnosePad.patientDiagnoseHT2;
  } else if (diastBP > diastPressMatrix[3][col]) {
    valorTablaDiast = diastPressMatrix[3][col];
    diastBpPerc = bpTablePercs[3];
    patDiagPad = PatientDiagnosePad.patientDiagnoseHT2;
    diastAvove = true;
  }

  // Ahora recorro las filas de la tabla de presiones sistólicas
  if (sistBP < sistPressMatrix[0][col]) {
    valorTablaSist = sistPressMatrix[0][col];
    sistBpPerc = bpTablePercs[0];
    patDiagPas = PatientDiagnosePas.patientDiagnoseNorm;
    sistBelow = true;
  } else if (sistBP == sistPressMatrix[0][col]) {
    valorTablaSist = sistPressMatrix[0][col];
    patDiagPas = PatientDiagnosePas.patientDiagnoseNorm;
    sistBpPerc = bpTablePercs[0];
  } else if (sistBP > sistPressMatrix[0][col] && sistBP <= sistPressMatrix[1][col]) {
    valorTablaSist = sistPressMatrix[1][col];
    sistBpPerc = bpTablePercs[1];
    if (sistBP == sistPressMatrix[1][col]) {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT;
    } else {
      patDiagPas = PatientDiagnosePas.patientDiagnoseNorm;
    }
  } else if (sistBP > sistPressMatrix[1][col] && sistBP <= sistPressMatrix[2][col]) {
    valorTablaSist = sistPressMatrix[2][col];
    sistBpPerc = bpTablePercs[2];
    if (sistBP == sistPressMatrix[2][col]) {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT1;
    } else {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT;
    }
  } else if (sistBP > sistPressMatrix[2][col] && sistBP <= sistPressMatrix[3][col]) {
    valorTablaSist = sistPressMatrix[3][col];
    sistBpPerc = bpTablePercs[3];
    if (sistBP == sistPressMatrix[3][col]) {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT2;
    } else {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT1;
    }
  } else if (sistBP == sistPressMatrix[3][col]) {
    valorTablaSist = sistPressMatrix[3][col];
    sistBpPerc = bpTablePercs[3];
    patDiagPas = PatientDiagnosePas.patientDiagnoseHT2;
  } else if (sistBP > sistPressMatrix[3][col]) {
    valorTablaSist = sistPressMatrix[3][col];
    sistBpPerc = bpTablePercs[3];
    patDiagPas = PatientDiagnosePas.patientDiagnoseHT2;
    sistAvove = true;
  }

/*
  Esto me lo mandó Marina por WhatsApp
  Paciente normotenso , ( serían los casos en que ambos valores son menores a percentilo 90)
  Paciente prehipertenso ( cuando uno o los dos valores dan igual a  90 y menor a 95)
  Paciente con hipertension estadio 1 ( cuando al menos un valor o los dos dan igual a  95 y menor a 95+12)
  Paciente con hipertensión estadio 2 (cuando al menos uno o los dos valores dan igual o más de 95+12)
*/

  if (patDiagPas == PatientDiagnosePas.patientDiagnoseHT2 || patDiagPad == PatientDiagnosePad.patientDiagnoseHT2) {
    patientDiagnose = l10n.patientDiagnoseHT2;
  } else if (patDiagPas == PatientDiagnosePas.patientDiagnoseHT1 || patDiagPad == PatientDiagnosePad.patientDiagnoseHT1) {
    patientDiagnose = l10n.patientDiagnoseHT1;
  } else if (patDiagPas == PatientDiagnosePas.patientDiagnoseHT || patDiagPad == PatientDiagnosePad.patientDiagnoseHT) {
    patientDiagnose = l10n.patientDiagnoseHT;
  } else {
    patientDiagnose = l10n.patientDiagnoseNorm;
  }

  debugPrint("Diagnóstico: $patientDiagnose");

  debugPrint("Altura tabla utilizada: ${heightsMatrix[col]}");
  debugPrint("PAS: $sistBP Perc Sistólica: $sistBpPerc basado en tabla: $valorTablaSist");
  debugPrint("PAD: $diastBP Perc Diastólica: $diastBpPerc basado en tabla: $valorTablaDiast");

  String result;
  // valorTablaSistA == 0 means patient's BP is not within a range but is below the lowest value
  if (sistBpPerc == bpTablePercs[0] && sistBelow == true) {
    result = l10n.resultPasUnder_50;
  } else if (sistBpPerc == bpTablePercs[0]) {
    result = l10n.resultPasEqual_50;
  } else if (sistBpPerc == bpTablePercs[1]) {
    result = l10n.resultPas_50to90;
  } else if (sistBpPerc == bpTablePercs[2]) {
    result = l10n.resultPas_90to95;
  } else if (sistBpPerc == bpTablePercs[3] && sistAvove == true) {
    result = l10n.resultPasAbove_95plus12;
  } else {
    result = l10n.resultPas_95to95plus12;
  }

  // valorTablaDiastA == 0 means patient's BP is not within a range but is below the lowest value
  if (diastBpPerc == bpTablePercs[0] && diastBelow == true) {
    result += l10n.resultPadUnder_50;
  } else if (diastBpPerc == bpTablePercs[0]) {
    result += l10n.resultPadEqual_50;
  } else if (diastBpPerc == bpTablePercs[1]) {
    result += l10n.resultPad_50to90;
  } else if (diastBpPerc == bpTablePercs[2]) {
    result += l10n.resultPad_90to95;
  } else if (diastBpPerc == bpTablePercs[3] && diastAvove == true) {
    result += l10n.resultPadAbove_95plus12;
  } else {
    result += l10n.resultPad_95to95plus12;
  }

  return [patientDiagnose, result];
}
