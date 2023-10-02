import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:precarina/model/precarina_model.dart';
import 'dart:async';
import 'package:localization/localization.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String resultPasUnder_50 = "El percentilo de PAS determinado es menor a percentilo 50\n";
String resultPasEqual_50 = "El percentilo de PAS determinado es igual a 50\n";
String resultPas_50to90 = "El percentilo de PAS determinado está entre 50 y 90\n";
String resultPas_90to95 = "El percentilo de PAS determinado está entre 90 y 95\n";
String resultPas_95to95plus12 = "El percentilo de PAS determinado está entre 95 y 95 + 12 mmHg\n";
String resultPasEqual_95plus12 = "El percentilo de PAS determinado es 95 + 12 mmHg\n";
String resultPasAbove_95plus12 = "El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n";

String resultPadUnder_50 = "El percentilo de PAD determinado es menor a percentilo 50\n";
String resultPadEqual_50 = "El percentilo de PAD determinado es igual a 50\n";
String resultPad_50to90 = "El percentilo de PAD determinado está entre 50 y 90\n";
String resultPad_90to95 = "El percentilo de PAD determinado está entre 90 y 95\n";
String resultPad_95to95plus12 = "El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n";
String resultPadEqual_95plus12 = "El percentilo de PAD determinado es 95 + 12 mmHg\n";
String resultPadAbove_95plus12 = "El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n";

String patientDiagnoseHT2 = "Paciente con hipertensión estadio 2";
String patientDiagnoseHT1 = "Paciente con hipertensión estadio 1";
String patientDiagnoseHT = "Paciente prehipertenso";
String patientDiagnoseNorm = "Paciente normotenso";

enum PatientDiagnosePas { patientDiagnoseHT2, patientDiagnoseHT1, patientDiagnoseHT, patientDiagnoseNorm }

enum PatientDiagnosePad { patientDiagnoseHT2, patientDiagnoseHT1, patientDiagnoseHT, patientDiagnoseNorm }

PatientDiagnosePas? patDiagPas;
PatientDiagnosePad? patDiagPad;

Future<List<String>> searchBloodPressurePercentiles({
  required PatientSex sex,
  required double height,
  required int age,
  required int systBP,
  required int diastBP,
}) async {

  String result = "";

  String patientDiagnose;

  // A partir de los 16 años se usa el criterio de adultos
  if (age >= 16) {
    if (systBP < 130 && diastBP < 85) {
      patientDiagnose = "patientDiagnoseNorm".i18n();
    } else if (systBP <= 139 && diastBP <= 89) {
      patientDiagnose = "patientDiagnoseHT".i18n();
    } else if (systBP <= 159 && diastBP <= 99) {
      patientDiagnose = "patientDiagnoseHT1".i18n();
    } else if (systBP <= 179 && diastBP <= 109) {
      patientDiagnose = "patientDiagnoseHT2".i18n();
    } else {
      patientDiagnose = "patientDiagnoseHT3".i18n();
    }

    return [patientDiagnose, "resultAgeOver16".i18n()];
  }

  // Si llegué hasta acá es porque tiene hasta 16 años inclusive
  // Si la base de datos está en el directorio adecuado, la uso, si no, la copio al directotio
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "blood_pressure.db");

// Check if the database exists
  var exists = await databaseExists(path);

  // Si no "existe"en el directorio de bd, la copio.
  if (!exists) {
    // Should happen only the first time you launch your application
    debugPrint("Creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(url.join("assets", "blood_pressure.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    debugPrint("Opening existing database");
  }

  // open the database
  var db = await openDatabase(path, readOnly: true);

  String qSex = (sex == PatientSex.female ? "F" : "M");

  // Busco la tabla correspondiente al sexo y la edad del paciente.
  List queryResults = await db.query(
    'percentiles',
    where: "sex = ? and age = ?",
    whereArgs: [qSex, age],
    orderBy: "height ASC, diastolic ASC",
  );


  // Imprimo los registros correspondientes a la edad y sexo.
  for (var x in queryResults) {
    debugPrint(x.toString());
  }


  // Cada línea tiene una facha tipo: {id: 3, sex: F, age: 1, height: 75.4, systolic: 84, diastolic: 41, percentile: 50}

  // Tiene que haber 28 líneas (altura (7) * nivel de presión (4))
  if (queryResults.length != 28) debugPrint("************** ERROR EN LA BASE DE DATOS **************");

  // A partir de la estatura busco la columna de la tabla de PA que me interesa (equivale a 4 registros consecutivos)

  // El shift me marca la Columna elegida de la tabla de presiones.
  // Cada fila de la tabla corresponde a un casillero de la tabla (en realidad a dos porque tiene diast y sist)
  int pickedHeighGroup = -1;

  // O sea que junté las dos tablas. Como el resultado está ordenado por altura, la misma cambia cada 4 líneas de la BD.
  for (int i = 0; i < 27; i += 4) {
    if (height <= queryResults[i]['height']) {
      debugPrint("Tomo como altura de referencia ${queryResults[i]['height']}");
      pickedHeighGroup = i ~/ 4; // Las alturas van de 4 en 4
      break;
    }
  }

  // Si no entró nunca en el if es porque la altura es mayor a la mayor => tomo la mayor altura.
  if (pickedHeighGroup == -1) pickedHeighGroup = 6; // Me indica el grupo que necesito pora recorrer una altura determinada

  // Me salteo los regitros de las alturas menores (que van de 4 en 4)
  int pickedHeighGroupInitReg = pickedHeighGroup * 4;

  // Ya tengo la columa. Ahora busco la fila de la tabla de presiones para diast y sist
  int pickedSist = 0;

  // No econtré => es mayor que la mayor => uso la úlitma fila
  if (pickedSist == 0) pickedSist = 3;

  /*
    Esto me lo mandó Marina por WhatsApp
    Paciente normotenso , ( serían los casos en que ambos valores son menores a percentilo 90)
    Paciente prehipertenso ( cuando uno o los dos valores dan igual a  90 y menor a 95)
    Paciente con hipertension estadio 1 ( cuando al menos un valor o los dos dan igual a  95 y menor a 95+12)
    Paciente con hipertensión estadio 2 (cuando al menos uno o los dos valores dan igual o más de 95+12)
  */

  // Dentro de las rows (de la bd) busco los índices para cada categoría
  int index50 = pickedHeighGroupInitReg + 0;
  int index90 = pickedHeighGroupInitReg + 1;
  int index95 = pickedHeighGroupInitReg + 2;
  int index95plus12 = pickedHeighGroupInitReg + 3;

  //Anora busco las presiones límite para cada categoría
  int syst50 = queryResults[index50]["systolic"];
  int syst90 = queryResults[index90]["systolic"];
  int syst95 = queryResults[index95]["systolic"];
  int syst95plus12 = queryResults[index95plus12]["systolic"];

  int diast50 = queryResults[index50]["diastolic"];
  int diast90 = queryResults[index90]["diastolic"];
  int diast95 = queryResults[index95]["diastolic"];
  int diast95plus12 = queryResults[index95plus12]["diastolic"];

  // Ahora recorro las filas de la tabla de presiones sistólicas para diagnosticar
  // < 50
  if (systBP < syst50) {
    result = "resultPasUnder_50".i18n();
    patDiagPas = PatientDiagnosePas.patientDiagnoseNorm;
    // == 50
  } else if (systBP == syst50) {
    result = "resultPasEqual_50".i18n();
    patDiagPas = PatientDiagnosePas.patientDiagnoseNorm;
    // Entre 50+ y 90
  } else if (systBP > syst50 && systBP <= syst90) {
    result = "resultPas_50to90".i18n();
    // 90
    if (systBP == syst90) {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT;
      // +50 y <90
    } else {
      patDiagPas = PatientDiagnosePas.patientDiagnoseNorm;
    }
    // Entre 90 y 95
  } else if (systBP > syst90 && systBP <= syst95) {
    result = "resultPas_90to95".i18n();
    // =95
    if (systBP == syst95) {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT1;
      // +90 y <95
    } else {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT;
    }
    // +95 y <= 95+12
  } else if (systBP > syst95 && systBP <= syst95plus12) {
    result = "resultPas_95to95plus12".i18n();
    if (systBP == syst95plus12) {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT2;
    } else {
      patDiagPas = PatientDiagnosePas.patientDiagnoseHT1;
    }
  } else if (systBP >= syst95plus12) {
    result = "resultPasAbove_95plus12".i18n();
    patDiagPas = PatientDiagnosePas.patientDiagnoseHT2;
  }

  // Ahora recorro las filas de la tabla de presiones diastólicas para completar el diagnóstico.
  // < 50
  if (diastBP < diast50) {
    result += "resultPadUnder_50".i18n();
    patDiagPad = PatientDiagnosePad.patientDiagnoseNorm;
    // == 50
  } else if (diastBP == diast50) {
    result += "resultPadEqual_50".i18n();
    patDiagPad = PatientDiagnosePad.patientDiagnoseNorm;
    // Entre 50+ y 90
  } else if (diastBP > diast50 && diastBP <=diast90) {
    result += "resultPad_50to90".i18n();
    // 90
    if (diastBP == diast90) {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT;
      // +50 y <90
    } else {
      patDiagPad = PatientDiagnosePad.patientDiagnoseNorm;
    }
    // Entre 90 y 95
  } else if (diastBP > diast90 && diastBP <= diast95) {
    result += "resultPad_90to95".i18n();
    // =95
    if (diastBP == diast95) {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT1;
      // +90 y <95
    } else {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT;
    }
    // +95 y <= 95+12
  } else if (diastBP > diast95 && diastBP <= diast95plus12) {
    result += "resultPad_95to95plus12".i18n();
    if (diastBP == diast95plus12) {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT2;
    } else {
      patDiagPad = PatientDiagnosePad.patientDiagnoseHT1;
    }
  } else if (diastBP >= diast95plus12) {
    result += "resultPadAbove_95plus12".i18n();
    patDiagPad = PatientDiagnosePad.patientDiagnoseHT2;
  }

/*
  Esto me lo mandó Marina por WhatsApp
  Paciente normotenso , ( serían los casos en que ambos valores son menores a percentilo 90)
  Paciente prehipertenso ( cuando uno o los dos valores dan igual a  90 y menor a 95)
  Paciente con hipertension estadio 1 ( cuando al menos un valor o los dos dan igual a  95 y menor a 95+12)
  Paciente con hipertensión estadio 2 (cuando al menos uno o los dos valores dan igual o más de 95+12)
*/

  if (patDiagPas == PatientDiagnosePas.patientDiagnoseHT2 || patDiagPad == PatientDiagnosePad.patientDiagnoseHT2) {
    patientDiagnose = patientDiagnoseHT2;
  } else if (patDiagPas == PatientDiagnosePas.patientDiagnoseHT1 || patDiagPad == PatientDiagnosePad.patientDiagnoseHT1) {
    patientDiagnose = patientDiagnoseHT1;
  } else if (patDiagPas == PatientDiagnosePas.patientDiagnoseHT || patDiagPad == PatientDiagnosePad.patientDiagnoseHT) {
    patientDiagnose = patientDiagnoseHT;
  } else {
    patientDiagnose = patientDiagnoseNorm;
  }

  debugPrint("Diagnóstico: $patientDiagnose");

  return [patientDiagnose, result];
}
