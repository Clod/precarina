import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:localization/localization.dart';
import 'package:precarina/behaviors_and_factors_screens/blood_pressure_screen.dart';
import 'package:precarina/behaviors_and_factors_screens/body_mass_index_screen.dart';
import 'package:precarina/behaviors_and_factors_screens/cholesterol_screen.dart';
import 'package:precarina/behaviors_and_factors_screens/physical_activity_screen.dart';
import 'package:precarina/behaviors_and_factors_screens/smoke_exposure_screen.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:precarina/aux_widgets/pretty_gauge.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'behaviors_and_factors_screens/diabetes_screen.dart';
import 'behaviors_and_factors_screens/sleep_screen.dart';
import 'help_pages/help_drawer.dart';
import 'aux_widgets/linear_gauge_flexible.dart';
import 'package:precarina/behaviors_and_factors_screens/diet_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? dummy;
  int? valorDieta;
  late PrecarinaModel precaModel;

  @override
  Widget build(BuildContext context) {
    precaModel = Provider.of<PrecarinaModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'PRECARINA',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const HelpDrawer(),
      body: SafeArea(
        child: Container(
          // color: Colors.black12,
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              buildOneRow(context, AppLocalizations.of(context)!.txtDietButton, Colors.red, const DietScreen(), precaModel.dietValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(context, AppLocalizations.of(context)!.txtPhysicalActivityButton, Colors.red, const PhysicalActivityScreen(),
                  precaModel.physicalActivityValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(
                  context, AppLocalizations.of(context)!.txtSmokeExposureButton, Colors.red, const SmokeExposureScreen(), precaModel.smokeValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(context, AppLocalizations.of(context)!.txtSleepButton, Colors.red, const SleepScreen(), precaModel.sleepValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(
                  context, AppLocalizations.of(context)!.txtBodyMassIndexButton, Colors.blue, const BodyMassIndexScreen(), precaModel.bmiValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(
                  context, AppLocalizations.of(context)!.txtCholesterolButton, Colors.blue, const CholesterolScreen(), precaModel.cholesterolValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(context, AppLocalizations.of(context)!.txtDiabetesButton, Colors.blue, const DiabetesScreen(), precaModel.diabetesValue),
              const Expanded(child: SizedBox(height: 5)),
              buildOneRow(context, AppLocalizations.of(context)!.txtBloodPressureButton, Colors.blue, const BloodPressureScreen(),
                  precaModel.bloodPressureValue),
              const Expanded(child: SizedBox(height: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: [
                    Visibility(
                      visible: precaModel.showGreenSmiley,
                      child: Image.asset(
                        "assets/images/green_smiley.png",
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    Visibility(
                      visible: precaModel.showYellowSmiley,
                      child: Image.asset(
                        "assets/images/yellow_smiley.png",
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    Visibility(
                      visible: precaModel.showRedSmiley,
                      child: Image.asset(
                        "assets/images/red_smiley.png",
                        width: 50.0,
                        height: 50.0,
                      ),
                    )
                  ]),
                  GestureDetector(
                    onLongPress: () => precaModel.resetValues(), // notifylisteners() ensures update of UI
                    child: buildPrettyGauge(precaModel.average),
                  ),
                  Stack(children: [
                    Visibility(
                      visible: precaModel.showGreenSmiley,
                      child: Image.asset(
                        "assets/images/green_smiley.png",
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    Visibility(
                      visible: precaModel.showYellowSmiley,
                      child: Image.asset(
                        "assets/images/yellow_smiley.png",
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    Visibility(
                      visible: precaModel.showRedSmiley,
                      child: Image.asset(
                        "assets/images/red_smiley.png",
                        width: 50.0,
                        height: 50.0,
                      ),
                    )
                  ]),
                ],
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
      ),
    );
  }

  Row buildOneRow(
    BuildContext context,
    String textoBoton,
    Color? buttonColor,
    Widget screenToGo,
    int? valueToDisplay,
  ) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          height: 35.0,
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(buttonColor)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => screenToGo,
                ),
              );
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
                  child: LinearGaugeFlexible(
                    //valueToSignal: precaModel.calculateAverage(),
                    valueToSignal: valueToDisplay,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPrettyGauge(value) {
    debugPrint("Dibujando PrettyGauge con valor $value");

    if (precaModel.average != null) {
      return PrettyGauge(
        gaugeSize: 190, // Size of a sqare that contains the Gauge
        // https://meyerweb.com/eric/tools/color-blend/#FFEB3B:4CAF50:3:rgbd
        segments: [
          GaugeSegment('Low', 10, Colors.red),
          GaugeSegment('', 10, const Color.fromRGBO(246, 101, 55, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(248, 134, 56, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(251, 168, 57, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(253, 201, 58, 1.0)),
          GaugeSegment('Medium High', 10, Colors.yellow),
          GaugeSegment('', 10, const Color.fromRGBO(210, 220, 64, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(182, 215, 64, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(155, 210, 65, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(121, 190, 75, 1.0)), // New shade of green
          GaugeSegment('High', 10, Colors.green),
        ],
        currentValue: value,
        displayWidget: const Text('Score', style: TextStyle(fontSize: 16)),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 190.0,
        width: 300.0,
        child: Center(
          child: Html(
            data: AppLocalizations.of(context)!.txtAppleWarning,
          ),
        ),
      );
    }

/*    return Stack(
        children: [
      PrettyGauge(
        gaugeSize: 190, // Size of a sqare that contains the Gauge
        // https://meyerweb.com/eric/tools/color-blend/#FFEB3B:4CAF50:3:rgbd
        segments: [
          GaugeSegment('Low', 10, Colors.red),
          GaugeSegment('', 10, const Color.fromRGBO(246, 101, 55, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(248, 134, 56, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(251, 168, 57, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(253, 201, 58, 1.0)),
          GaugeSegment('Medium High', 10, Colors.yellow),
          GaugeSegment('', 10, const Color.fromRGBO(210, 220, 64, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(182, 215, 64, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(155, 210, 65, 1.0)),
          GaugeSegment('', 10, const Color.fromRGBO(121, 190, 75, 1.0)), // New shade of green
          GaugeSegment('High', 10, Colors.green),
        ],
        currentValue: value,
        displayWidget: const Text('Score', style: TextStyle(fontSize: 16)),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 190.0,
        width: 300.0,
        child: Center(
          child: Html(
            data: r'''
<p style="text-align:center"><span style="font-size:16px"><strong><span style="color:#ffffff">IMPORTANTE</span></strong></span></p>

<p style="text-align:center"><span style="font-size:14px"><span style="color:#ffffff">Luego de cargar toda la informaci&oacute;n se mostrar&aacute; el score. El mismo es orientativo y</span></span></p>

<p style="text-align:center"><span style="font-size:14px"><span style="color:#ffffff"><u>NO PUEDE REEMPLAZAR LA CONSULTA PERI&Oacute;DICA CON UN M&Eacute;DICO</u></span></span></p>
''',
          ),
        ),
      )
    ]);*/
  }
}
