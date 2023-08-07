import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../aux_widgets/vertical_space.dart';
import '../model/precarina_model.dart';

const dataTypeStyle = TextStyle(fontWeight: FontWeight.bold);
const unitsStyle = TextStyle(fontStyle: FontStyle.italic);

class PagesHeader extends StatelessWidget {
  const PagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final precaModel = Provider.of<PrecarinaModel>(context);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.yellow[200],
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sexo: ", style: dataTypeStyle),
                      Text(
                        precaModel.patientSex == PatientSex.female ? "Mujer" : "Varón",
                        style: unitsStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Edad: ", style: dataTypeStyle),
                      Text("${precaModel.ageYears}"),
                      Text(
                        precaModel.ageYears == 0 || precaModel.ageYears == 1 ? ' año ' : ' años ',
                        style: unitsStyle,
                      ),
                      Text("${precaModel.ageMonths}"),
                      Text(
                        (precaModel.ageMonths == 1 ? ' mes ' : ' meses '),
                        style: unitsStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Peso: ", style: dataTypeStyle),
                      Text("${precaModel.weightKilos}"),
                      const Text(" Kg ", style: unitsStyle),
                      Text("${precaModel.weightGrams}"),
                      const Text(" g", style: unitsStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Estatura: ", style: dataTypeStyle),
                      Text("${precaModel.height}"),
                      const Text(
                        " cm",
                        style: unitsStyle,
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 5.0,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
