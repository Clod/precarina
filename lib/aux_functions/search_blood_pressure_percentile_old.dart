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

enum PatientDiagnosePas {patientDignoseHT2,patientDignoseHT1, patientDignoseHT, patientDignoseNorm}
enum PatientDiagnosePad {patientDignoseHT2,patientDignoseHT1, patientDignoseHT, patientDignoseNorm}

PatientDiagnosePas? patDiagPas;
PatientDiagnosePad? patDiagPad;


List<String> searchBloodPressurePercentiles({
  required PatientSex sex,
  required double height,
  required int age,
  required int sistBP,
  required int diastBP,
}) {
  String sexIndex = "males";
  String? diastBpPerc;
  String? sistBpPerc;
  int valorTablaSist = 0;
  int valorTablaDiast = 0;
  int valorTablaSistA = 0;
  int valorTablaDiastA = 0;
  double alturaTabla = 0;

  if (sex == PatientSex.female) sexIndex = "females";

  // Percentile values in the table.
  var bpTablePercs = ['50', '90', '95', '95 + 12 mmHg'];

  // I select heights array according to sex and age
  List<double> heights = heightBoth[sexIndex]![age - 1];

  // Now I select the matrixes according to sex and age
  List<List<int>> diastMatrix = diastolicBoth[sexIndex]![age - 1];

  List<List<int>> sistMatrix = sistolicBoth[sexIndex]![age - 1];

  int col1 = 0;
  int col2 = 1;
  int col3 = 2;
  int col4 = 3;
  int col5 = 4;
  int col6 = 5;
  int col7 = 6;
  int row1 = 0;
  int row2 = 1;
  int row3 = 2;
  int row4 = 3;

  String patientDignose;

  // Diastolic Pressure
  // I pick the column to search according to patient's height
  // If patient's height is not in the table I pick the immediate higher
  if (height <= heights[col1]) {
    alturaTabla = heights[col1];
    // If patients diastolic pressure (diastBP) is below the lowest in the table I pick the latter
    if (diastBP <= diastMatrix[row1][col1]) {
      valorTablaDiast = diastMatrix[row1][col1];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col1]) {
      // Pressure value immediate below patient's
      valorTablaDiastA = diastMatrix[row1][col1];
      // Pressure value immediate above patient's
      valorTablaDiast = diastMatrix[row2][col1];
      // I keep the one immediate above
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col1]) {
      valorTablaDiastA = diastMatrix[row2][col1];
      valorTablaDiast = diastMatrix[row3][col1];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col1]) {
      valorTablaDiastA = diastMatrix[row3][col1];
      valorTablaDiast = diastMatrix[row4][col1];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col1];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  } else if (height <= heights[col2]) {
    alturaTabla = heights[col2];
    if (diastBP <= diastMatrix[row1][col2]) {
      valorTablaDiast = diastMatrix[row1][col2];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col2]) {
      valorTablaDiastA = diastMatrix[row1][col2];
      valorTablaDiast = diastMatrix[row2][col2];
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col2]) {
      valorTablaDiastA = diastMatrix[row2][col2];
      valorTablaDiast = diastMatrix[row3][col2];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col2]) {
      valorTablaDiast = diastMatrix[row3][col2];
      valorTablaDiast = diastMatrix[row4][col2];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col2];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  } else if (height <= heights[col3]) {
    alturaTabla = heights[col3];
    if (diastBP <= diastMatrix[row1][col3]) {
      valorTablaDiast = diastMatrix[row1][col3];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col3]) {
      valorTablaDiastA = diastMatrix[row1][col3];
      valorTablaDiast = diastMatrix[row2][col3];
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col3]) {
      valorTablaDiastA = diastMatrix[row2][col3];
      valorTablaDiast = diastMatrix[row3][col3];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col3]) {
      valorTablaDiastA = diastMatrix[row3][col3];
      valorTablaDiast = diastMatrix[row4][col3];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col3];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  } else if (height <= heights[col4]) {
    alturaTabla = heights[col4];
    if (diastBP <= diastMatrix[row1][col4]) {
      valorTablaDiast = diastMatrix[row1][col4];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col4]) {
      valorTablaDiastA = diastMatrix[row1][col4];
      valorTablaDiast = diastMatrix[row2][col4];
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col4]) {
      valorTablaDiastA = diastMatrix[row2][col4];
      valorTablaDiast = diastMatrix[row3][col4];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col4]) {
      valorTablaDiastA = diastMatrix[row3][col4];
      valorTablaDiast = diastMatrix[row4][col4];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col4];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  } else if (height <= heights[col5]) {
    alturaTabla = heights[col5];
    if (diastBP <= diastMatrix[row1][col5]) {
      valorTablaDiast = diastMatrix[row1][col5];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col5]) {
      valorTablaDiastA = diastMatrix[row1][col5];
      valorTablaDiast = diastMatrix[row2][col5];
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col5]) {
      valorTablaDiastA = diastMatrix[row2][col5];
      valorTablaDiast = diastMatrix[row3][col5];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col5]) {
      valorTablaDiastA = diastMatrix[row3][col5];
      valorTablaDiast = diastMatrix[row4][col5];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col5];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  } else if (height <= heights[col6]) {
    alturaTabla = heights[col6];
    if (diastBP <= diastMatrix[row1][col6]) {
      valorTablaDiast = diastMatrix[row1][col6];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col6]) {
      valorTablaDiastA = diastMatrix[row1][col6];
      valorTablaDiast = diastMatrix[row2][col6];
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col6]) {
      valorTablaDiastA = diastMatrix[row2][col6];
      valorTablaDiast = diastMatrix[row3][col6];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col6]) {
      valorTablaDiastA = diastMatrix[row3][col6];
      valorTablaDiast = diastMatrix[row4][col6];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col6];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  } else {
    alturaTabla = heights[col7];
    if (diastBP <= diastMatrix[row1][col7]) {
      valorTablaDiast = diastMatrix[row1][col7];
      diastBpPerc = bpTablePercs[0];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row2][col7]) {
      valorTablaDiastA = diastMatrix[row1][col7];
      valorTablaDiast = diastMatrix[row2][col7];
      diastBpPerc = bpTablePercs[1];
      patDiagPad = PatientDiagnosePad.patientDignoseNorm;
    } else if (diastBP <= diastMatrix[row3][col7]) {
      valorTablaDiastA = diastMatrix[row2][col7];
      valorTablaDiast = diastMatrix[row3][col7];
      diastBpPerc = bpTablePercs[2];
      patDiagPad = PatientDiagnosePad.patientDignoseHT;
    } else if (diastBP <= diastMatrix[row4][col7]) {
      valorTablaDiastA = diastMatrix[row3][col7];
      valorTablaDiast = diastMatrix[row4][col7];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT1;
    } else {
      valorTablaDiastA = 1000;
      valorTablaDiast = diastMatrix[row4][col7];
      diastBpPerc = bpTablePercs[3];
      patDiagPad = PatientDiagnosePad.patientDignoseHT2;
    }
  }

  // Sistolic Pressure
  if (height <= heights[col1]) {
    if (sistBP <= sistMatrix[row1][col1]) {
      valorTablaSist = sistMatrix[row1][col1];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col1]) {
      valorTablaSistA = sistMatrix[row1][col1];
      valorTablaSist = sistMatrix[row2][col1];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col1]) {
      valorTablaSistA = sistMatrix[row2][col1];
      valorTablaSist = sistMatrix[row3][col1];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col1]) {
      valorTablaSistA = sistMatrix[row3][col1];
      valorTablaSist = sistMatrix[row4][col1];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col1];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    }
  } else if (height <= heights[col2]) {
    if (sistBP <= sistMatrix[row1][col2]) {
      valorTablaSist = sistMatrix[row1][col2];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col2]) {
      valorTablaSistA = sistMatrix[row1][col2];
      valorTablaSist = sistMatrix[row2][col2];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col2]) {
      valorTablaSistA = sistMatrix[row2][col2];
      valorTablaSist = sistMatrix[row3][col2];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col2]) {
      valorTablaSist = sistMatrix[row4][col2];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col2];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    }
  } else if (height <= heights[col3]) {
    if (sistBP <= sistMatrix[row1][col3]) {
      valorTablaSist = sistMatrix[row1][col3];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col3]) {
      valorTablaSistA = sistMatrix[row1][col3];
      valorTablaSist = sistMatrix[row2][col3];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col3]) {
      valorTablaSistA = sistMatrix[row2][col3];
      valorTablaSist = sistMatrix[row3][col3];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col3]) {
      valorTablaSist = sistMatrix[row4][col3];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col3];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    }
  } else if (height <= heights[col4]) {
    if (sistBP <= sistMatrix[row1][col4]) {
      valorTablaSist = sistMatrix[row1][col4];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col4]) {
      valorTablaSistA = sistMatrix[row1][col4];
      valorTablaSist = sistMatrix[row2][col4];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col4]) {
      valorTablaSistA = sistMatrix[row2][col4];
      valorTablaSist = sistMatrix[row3][col4];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col4]) {
      valorTablaSist = sistMatrix[row4][col4];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col4];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    }
  } else if (height <= heights[col5]) {
    if (sistBP <= sistMatrix[row1][col5]) {
      valorTablaSist = sistMatrix[row1][col5];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col5]) {
      valorTablaSistA = sistMatrix[row1][col5];
      valorTablaSist = sistMatrix[row2][col5];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col5]) {
      valorTablaSistA = sistMatrix[row2][col5];
      valorTablaSist = sistMatrix[row3][col5];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col5]) {
      valorTablaSist = sistMatrix[row4][col5];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col5];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    }
  } else if (height <= heights[col6]) {
    if (sistBP <= sistMatrix[row1][col6]) {
      valorTablaSist = sistMatrix[row1][col6];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col6]) {
      valorTablaSistA = sistMatrix[row1][col6];
      valorTablaSist = sistMatrix[row2][col6];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col6]) {
      valorTablaSistA = sistMatrix[row2][col6];
      valorTablaSist = sistMatrix[row3][col6];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col6]) {
      valorTablaSistA = sistMatrix[row3][col6];
      valorTablaSist = sistMatrix[row4][col6];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col6];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    }
  } else {
    if (sistBP <= sistMatrix[row1][col7]) {
      valorTablaSist = sistMatrix[row1][col7];
      sistBpPerc = bpTablePercs[0];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row2][col7]) {
      valorTablaSistA = sistMatrix[row1][col7];
      valorTablaSist = sistMatrix[row2][col7];
      sistBpPerc = bpTablePercs[1];
      patDiagPas = PatientDiagnosePas.patientDignoseNorm;
    } else if (sistBP <= sistMatrix[row3][col7]) {
      valorTablaSistA = sistMatrix[row2][col7];
      valorTablaSist = sistMatrix[row3][col7];
      sistBpPerc = bpTablePercs[2];
      patDiagPas = PatientDiagnosePas.patientDignoseHT;
    } else if (sistBP <= sistMatrix[row4][col7]) {
      valorTablaSist = sistMatrix[row3][col7];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT1;
    } else {
      valorTablaSistA = 1000;
      valorTablaSist = sistMatrix[row4][col7];
      sistBpPerc = bpTablePercs[3];
      patDiagPas = PatientDiagnosePas.patientDignoseHT2;
    }
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

  debugPrint("Altura tabla utilizada: $alturaTabla");
  debugPrint("PAS: $sistBP Perc Sistólica: $sistBpPerc basado en tabla: $valorTablaSist");
  debugPrint("PAD: $diastBP Perc Diastólica: $diastBpPerc basado en tabla: $valorTablaDiast");

/*
  String sexo = (sex == PatientSex.female)
      ? "Para una nena de $height cm de altura se utilizó la altura de la tabla $alturaTabla\n"
      : "Para un varón de $height cm de altura se utilizó la altura de la tabla $alturaTabla\n";
  String pas = "PAS: $sistBP Perc Sistólica: $sistBpPerc basado en tabla: $valorTablaSist\n";
  String pad = "PAD: $diastBP Perc Diastólica: $diastBpPerc basado en tabla: $valorTablaDiast";

  String result = 'La altura utilizada de la tabla es: $alturaTabla \n';
  if (valorTablaSistA == 0) {
    result += 'El percentilo de PAS determinado es de $sistBpPerc por encontrarse su valor por debajo del mínimo tabulado: $valorTablaSist\n';
  } else if (valorTablaSistA == 1000) {
    result += 'El percentilo de PAS determinado es de $sistBpPerc por encontrarse su valor por encima del máximo tabulado: $valorTablaSist\n';
  } else {
    result +=
        'El percentilo de PAS determinado es de $sistBpPerc por encontrarse su valor entre los valores tabulados para $valorTablaSistA y $valorTablaSist\n';
  }
  if (valorTablaDiastA == 0) {
    result += 'El percentilo de PAD determinado es de $diastBpPerc por encontrarse su valor por debajo del mínimo tabulado: $valorTablaDiast\n';
  } else if (valorTablaDiastA == 1000) {
    result += 'El percentilo de PAD determinado es de $diastBpPerc por encontrarse su valor por encima del máximo tabulado: $valorTablaDiast\n';
  } else {
    result +=
        'El percentilo de PAD determinado es de $diastBpPerc por encontrarse su valor entre los valores tabulados para $valorTablaDiastA y $valorTablaDiast\n';
  }
*/

  String result;
  // valorTablaSistA == 0 means patient's BP is not within a range but is below the lowest value
  if (sistBpPerc == bpTablePercs[0] && valorTablaSistA == 0) {
    result = resultPasUnder_50;
  } else if (sistBpPerc == bpTablePercs[0]) {
    result = resultPasEqual_50;
  } else if (sistBpPerc == bpTablePercs[1]) {
    result = resultPas_50to90;
  } else if (sistBpPerc == bpTablePercs[2]) {
    result = resultPas_90to95;
    // valorTablaSistA == 1000 means patient's BP is not within a range but is above the highest value
  } else if (sistBpPerc == bpTablePercs[3] && valorTablaSistA != 1000) {
    result = resultPas_95to95plus12;
  } else {
    result = resultPasAbove_95plus12;
  }

  // valorTablaDiastA == 0 means patient's BP is not within a range but is below the lowest value
  if (diastBpPerc == bpTablePercs[0] && valorTablaDiastA == 0) {
    result += resultPadUnder_50;
  } else if (diastBpPerc == bpTablePercs[0]) {
    result += resultPadEqual_50;
  } else if (diastBpPerc == bpTablePercs[1]) {
    result += resultPad_50to90;
  } else if (diastBpPerc == bpTablePercs[2]) {
    result += resultPad_90to95;
    // valorTablaSistA == 1000 means patient's BP is not within a range but is above the highest value
  } else if (diastBpPerc == bpTablePercs[3] && valorTablaDiastA != 1000) {
    result += resultPad_95to95plus12;
  } else {
    result += resultPadAbove_95plus12;
  }

  return [patientDignose, result];
}
