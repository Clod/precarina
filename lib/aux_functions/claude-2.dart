import '../model/precarina_model.dart';
import '../model/pressure_data.dart';

List<String> searchBloodPresurePercentiles({
  required PatientSex sex,
  required double height,
  required int age,
  required int sistBP,
  required int diastBP,
}) {

  String sexIndex = sex == PatientSex.female ? "females" : "males";

  var bpTablePercs = ['50','90','95', '95 + 12 mmHg'];

  List<String> result = [];

  for (var pressureType in ['Diastolic', 'Sistolic']) {

    // Select matrices based on sex and age
    List<List<int>> matrix = pressureType == 'Diastolic' ?
    diastolicBoth[sexIndex]![age - 1] :
    sistolicBoth[sexIndex]![age - 1];

    // Search through height columns
    for (var i = 0; i < 7; i++) {
      if (height <= heightBoth[sexIndex]![age - 1][i]) {

        // Search through value rows
        for (var j = 0; j < 4; j++) {
          if (pressureType == 'Diastolic' && diastBP <= matrix[j][i]) {
            // Diastolic logic
            var diastPerc = bpTablePercs[j];
            result.add('Diastolic percentile: $diastPerc');
            break;
          } else if (pressureType == 'Sistolic' && sistBP <= matrix[j][i]) {
            // Sistolic logic
            var sistPerc = bpTablePercs[j];
            result.add('Sistolic percentile: $sistPerc');
            break;
          }
        }

        break;
      }
    }
  }

  String diagnosis = "Normal";

  if (result.contains('90')) diagnosis = "Prehypertension";
  if (result.contains('95')) diagnosis = "Stage 1 Hypertension";
  if (result.contains('95 + 12 mmHg')) diagnosis = "Stage 2 Hypertension";

  result.insert(0, diagnosis);

  return result;
}