import 'package:flutter/material.dart';
// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:precarina/pretty_gauge.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'aux_functions/show_terms_and_conds.dart';
import 'help_drawer.dart';
import 'linear_gauge.dart';
import 'linear_gauge_flexible.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _promedio = 0;
  int? dummy = null;

  int? valorDieta = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.black12,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            buildOneRow(context, AppLocalizations.of(context)!.txtDietButton, Colors.red, AppLocalizations.of(context)!.txtDietDialog,
                AppLocalizations.of(context)!.txtDietDialogOptions, valorDieta, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(context, AppLocalizations.of(context)!.txtPhysicalActivityButton, Colors.red,
                AppLocalizations.of(context)!.txtPhysicalActivityDialog, AppLocalizations.of(context)!.txtPhysicalActivityDialogOptions, 7, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(context, AppLocalizations.of(context)!.txtSmokeExposureButton, Colors.red, AppLocalizations.of(context)!.txtSmokeExposureDialog,
                AppLocalizations.of(context)!.txtSmokeExposureDialogOptions, 1, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(context, AppLocalizations.of(context)!.txtSleepButton, Colors.red, AppLocalizations.of(context)!.txtSleepDialog,
                AppLocalizations.of(context)!.txtSleepDialogOptions, 2, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(context, AppLocalizations.of(context)!.txtBodyMassIndexButton, Colors.blue,
                AppLocalizations.of(context)!.txtBodyMassIndexDialog, AppLocalizations.of(context)!.txtBodyMassIndexDialogOptions, 10, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(context, AppLocalizations.of(context)!.txtCholesterolButton, Colors.blue, AppLocalizations.of(context)!.txtCholesterolDialog,
                AppLocalizations.of(context)!.txtCholesterolDialogOptions, 3, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(context, AppLocalizations.of(context)!.txtDiabetesButton, Colors.blue, AppLocalizations.of(context)!.txtDiabetesDialog,
                AppLocalizations.of(context)!.txtDiabetesDialogOptions, 4, null),
            const Expanded(child: SizedBox(height: 5)),
            buildOneRow(
              context,
              AppLocalizations.of(context)!.txtBloodPressureButton,
              Colors.blue,
              AppLocalizations.of(context)!.txtBloodPressureDialog,
              AppLocalizations.of(context)!.txtBloodPressureDialogOptions,
              5,
              null,
              preText: AppLocalizations.of(context)!.txtBloodPressureWarning,
            ),
            const Expanded(child: SizedBox(height: 5)),
            GestureDetector(
              onLongPress: () => setState(() {
                // resetValues();
              }),
              child: buildPrettyGauge(),
            ),
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse('https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
              },
              child: Text(
                AppLocalizations.of(context)!.txtFundamentalsLocationMainWindow,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildOneRow(
      BuildContext context,
      String textoBoton,
      Color? buttonColor,
      String tituloDialogo,
      String listaOpciones,
      int? resultValue,
      setter, {
        String? preText,
      }) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          height: 35.0,
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
            onPressed: () {
              setState(() {
                (valorDieta == null) ? (valorDieta = 0) : (valorDieta = valorDieta! + 1);
              });
              // As this is a new list with new objets, the picked value is not included
              // I need to search for the equivalent object (I search for the same value
              // because the laguage might have changes in the middle.

              // optionsFull.forEach((element) {
              //   if (element.code.toString() == seleccion.code.toString()) {
              //     seleccion = element;
              //   }
              // }
            },
            child: Text(
              textoBoton,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 35,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                child: SizedBox(
                  height: 30.0,
                  width: 170,
                  child: LinearGaugeFlexible(valueToSignal: resultValue,),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  PrettyGauge buildPrettyGauge() {
    return PrettyGauge(
              gaugeSize: 190,
              // https://meyerweb.com/eric/tools/color-blend/#FFEB3B:4CAF50:3:rgbd
              segments: [
                GaugeSegment('Low', 10, Colors.red),
                GaugeSegment('', 10, const Color.fromRGBO(246, 101, 55, 100)),
                GaugeSegment('', 10, const Color.fromRGBO(248, 134, 56, 100)),
                GaugeSegment('', 10, const Color.fromRGBO(251, 168, 57, 100)),
                GaugeSegment('', 10, const Color.fromRGBO(253, 201, 58, 100)),
                GaugeSegment('Medium High', 10, Colors.yellow),
                GaugeSegment('', 10, const Color.fromRGBO(210, 220, 64, 100)),
                GaugeSegment('', 10, const Color.fromRGBO(166, 205, 70, 100)),
                GaugeSegment('', 10, const Color.fromRGBO(121, 190, 75, 100)),
                GaugeSegment('High', 10, Colors.green),
              ],
              currentValue: _promedio,
              displayWidget: const Text('Score', style: TextStyle(fontSize: 16)),
            );
  }
}
