import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/precarina_model.dart';

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
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5.0),
                    Text("Sexo: ${precaModel.patientSex == PatientSex.female ? "Mujer" : "Varón"}"),
                    Text("Edad: ${precaModel.ageYears} año(s) ${precaModel.ageMonths} mes(es)."),
                    Text("Peso: ${precaModel.weightKilos} Kg ${precaModel.weightGrams} g."),
                    Text("Estatura: ${precaModel.height} cm"),
                    const SizedBox(height: 5.0),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
