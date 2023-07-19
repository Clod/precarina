import 'package:flutter/cupertino.dart';
import 'package:precarina/model/precarina_model.dart';

import '../model/pressure_data.dart';

void searchBloodPresurePercentiles({
  required PatientSex sex,
  required double height,
  required int age,
  required int sistBP,
  required int diastBP,
}) {
  String sexIndex = "males";
  String diastBpPerc;
  String sistBpPerc;
  int valorTablaSist;
  int valorTablaDiast;

  if (sex == PatientSex.female) sexIndex = "females";

  // I select heights array according to sex and age
  List<double> heights = heightBoth[sexIndex]![age - 1];

  // Now I select the matrix according to sex and age
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

  // Diastolic Pressure
  if (height <= heights[col1]) {
    if (diastBP <= diastMatrix[row1][col1]) {
      valorTablaDiast = diastMatrix[row1][col1];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col1]) {
      valorTablaDiast = diastMatrix[row2][col1];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col1]) {
      valorTablaDiast = diastMatrix[row3][col1];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col1];
      diastBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col2]) {
    if (diastBP <= diastMatrix[row1][col2]) {
      valorTablaDiast = diastMatrix[row1][col2];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col2]) {
      valorTablaDiast = diastMatrix[row2][col2];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col2]) {
      valorTablaDiast = diastMatrix[row3][col2];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col1];
      diastBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col3]) {
    if (diastBP <= diastMatrix[row1][col3]) {
      valorTablaDiast = diastMatrix[row1][col3];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col3]) {
      valorTablaDiast = diastMatrix[row2][col3];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col3]) {
      valorTablaDiast = diastMatrix[row3][col3];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col3];
      diastBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col4]) {
    if (diastBP <= diastMatrix[row1][col4]) {
      valorTablaDiast = diastMatrix[row1][col4];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col4]) {
      valorTablaDiast = diastMatrix[row2][col4];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col4]) {
      valorTablaDiast = diastMatrix[row3][col4];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col4];
      diastBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col5]) {
    if (diastBP <= diastMatrix[row1][col5]) {
      valorTablaDiast = diastMatrix[row1][col5];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col5]) {
      valorTablaDiast = diastMatrix[row2][col5];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col5]) {
      valorTablaDiast = diastMatrix[row3][col5];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col5];
      diastBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col6]) {
    if (diastBP <= diastMatrix[row1][col6]) {
      valorTablaDiast = diastMatrix[row1][col6];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col6]) {
      valorTablaDiast = diastMatrix[row2][col6];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col6]) {
      valorTablaDiast = diastMatrix[row3][col6];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col6];
      diastBpPerc = "95 + 12 mmHg";
    }
  } else {
    if (diastBP <= diastMatrix[row1][col7]) {
      valorTablaDiast = diastMatrix[row1][col7];
      diastBpPerc = "50";
    } else if (diastBP <= diastMatrix[row2][col7]) {
      valorTablaDiast = diastMatrix[row2][col7];
      diastBpPerc = "90";
    } else if (diastBP <= diastMatrix[row3][col7]) {
      valorTablaDiast = diastMatrix[row3][col7];
      diastBpPerc = "95";
    } else {
      valorTablaDiast = diastMatrix[row4][col7];
      diastBpPerc = "95 + 12 mmHg";
    }
  }

  // Sistolic Pressure
  if (height <= heights[col1]) {
    if (sistBP <= sistMatrix[row1][col1]) {
      valorTablaSist = sistMatrix[row1][col1];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col1]) {
      valorTablaSist = sistMatrix[row2][col1];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col1]) {
      valorTablaSist = sistMatrix[row3][col1];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row4][col1];
      sistBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col2]) {
    if (sistBP <= sistMatrix[row1][col2]) {
      valorTablaSist = sistMatrix[row1][col2];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col2]) {
      valorTablaSist = sistMatrix[row2][col2];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col2]) {
      valorTablaSist = sistMatrix[row3][col2];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row4][col2];
      sistBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col3]) {
    if (sistBP <= sistMatrix[row1][col3]) {
      valorTablaSist = sistMatrix[row1][col3];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col3]) {
      valorTablaSist = sistMatrix[row2][col3];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col3]) {
      valorTablaSist = sistMatrix[row3][col3];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row4][col3];
      sistBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col4]) {
    if (sistBP <= sistMatrix[row1][col4]) {
      valorTablaSist = sistMatrix[row1][col4];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col4]) {
      valorTablaSist = sistMatrix[row2][col4];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col4]) {
      valorTablaSist = sistMatrix[row3][col4];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row4][col4];
      sistBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col5]) {
    if (sistBP <= sistMatrix[row1][col5]) {
      valorTablaSist = sistMatrix[row1][col5];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col5]) {
      valorTablaSist = sistMatrix[row2][col5];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col5]) {
      valorTablaSist = sistMatrix[row3][col5];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row4][col5];
      sistBpPerc = "95 + 12 mmHg";
    }
  } else if (height <= heights[col6]) {
    if (sistBP <= sistMatrix[row1][col6]) {
      valorTablaSist = sistMatrix[row1][col6];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col6]) {
      valorTablaSist = sistMatrix[row2][col6];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col6]) {
      valorTablaSist = sistMatrix[row3][col6];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row4][col6];
      sistBpPerc = "95 + 12 mmHg";
    }
  } else {
    if (sistBP <= sistMatrix[row1][col7]) {
      valorTablaSist = sistMatrix[row1][col7];
      sistBpPerc = "50";
    } else if (sistBP <= sistMatrix[row2][col7]) {
      valorTablaSist = sistMatrix[row2][col7];
      sistBpPerc = "90";
    } else if (sistBP <= sistMatrix[row3][col7]) {
      valorTablaSist = sistMatrix[row3][col7];
      sistBpPerc = "95";
    } else {
      valorTablaSist = sistMatrix[row3][col7];
      sistBpPerc = "95 + 12 mmHg";
    }
  }

  debugPrint("PAS: $sistBP Perc Sistólica: $sistBpPerc basado en tabla: $valorTablaSist");
  debugPrint("PAD: $diastBP Perc Diastólica: $diastBpPerc basado en tabla: $valorTablaDiast");

}
