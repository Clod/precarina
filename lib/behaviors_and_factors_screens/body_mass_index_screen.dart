import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:localization/localization.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import 'package:precarina/aux_functions/lose_input_warning.dart';
import 'package:precarina/help_pages/help_drawer.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

late final Interpreter _interpreter;

class BodyMassIndexScreen extends StatefulWidget {
  const BodyMassIndexScreen({super.key});

  @override
  State<BodyMassIndexScreen> createState() => _BodyMassIndexScreenState();
}

void _loadModel() async {
  debugPrint('Intento cargar intérprete');

  // Enable delegates
  final options = InterpreterOptions();

  debugPrint('Cargué las opcionesflutter build');

  const modelFile = 'assets/model.tflite';

  if (Platform.isAndroid) {
    options.addDelegate(XNNPackDelegate());
  }

  // doesn't work on emulator
  // if (Platform.isAndroid) {
  //   options.addDelegate(GpuDelegateV2());
  // }

  if (Platform.isIOS) {
    options.addDelegate(GpuDelegate());
  }

  try {
    // Creating the interpreter using Interpreter.fromAsset
    _interpreter = await Interpreter.fromAsset(modelFile, options: options);
    debugPrint('Interpreter loaded successfully');
  } catch (e) {
    debugPrint('Interpreter NOT loaded successfully');
    debugPrint("Error: $e");
  }
}

class _BodyMassIndexScreenState extends State<BodyMassIndexScreen> {
  var _precaModel = PrecarinaModel();

  String _imc = "";
  String _percentil = "";
  String _diagnose = "";

  int _percentilValue = 0;

  // Estimate percentile using ML model
  _estimatePercentile(BuildContext context) {
    // Hide the keyboard
    FocusScope.of(context).unfocus();
    // var input = [[7.011268, 12.637012, 0.0, 1.0]];
    List<List<double>> input = [
      [0.0, 0.0, 0.0, 0.0]
    ];
    var output = [
      [0.00]
    ];

    double? totalWeight = _precaModel.weightKilos! + _precaModel.weightGrams! / 1000.0;

    double imc = totalWeight / pow((_precaModel.height! / 100.0), 2);

    double edad = _precaModel.ageYears! + _precaModel.ageMonths! / 12.0;

    input[0][1] = imc;
    input[0][0] = edad;

    if (_precaModel.patientSex == PatientSex.female) {
      input[0][2] = 1.0;
      input[0][3] = 0.0;
    } else {
      input[0][2] = 0.0;
      input[0][3] = 1.0;
    }

    // inference
    debugPrint(imc.toString());

    _interpreter.run(input, output);
    // debugPrint the output
    debugPrint(input.toString());
    debugPrint(output.toString());
    setState(() {
      _imc = imc.toStringAsFixed(2);

      _percentilValue = output[0][0].truncate();

      if (_percentilValue >= 100.0) {
        _percentil = '100 %';
        _percentilValue = 100;
      } else if (_percentilValue <= 0.0) {
        _percentil = '0 %';
        _percentilValue = 0;
      } else {
        _percentil = '$_percentilValue %';
      }
    });

    // Now let's go fo the diagnose
    _diagnose = _determineDiagnose(_percentilValue);
  }

  @override
  void initState() {
    super.initState();

    try {
      _loadModel();
    } catch (e) {
      debugPrint("Error al cargar el Modelo: ${e.toString()}");
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precaModel = Provider.of<PrecarinaModel>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building Widget");

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.txtBodyMassIndexButton),
        // Add a back button that shows a warning dialog
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            final shouldPop = await showInputLostWarning(context);
            if (shouldPop && context.mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      drawer: const HelpDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: PagesHeader(),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VerticalSpace(height: 15.0),
                    Text(
                      "txtBMI".i18n(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    const VerticalSpace(height: 5.0),
                    Text(
                      _imc,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const VerticalSpace(height: 10.0),
                    Text(
                      "txtPercentile".i18n(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    const VerticalSpace(height: 5.0),
                    Text(
                      _percentil,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const VerticalSpace(height: 10.0),
                    Text(
                      "txtDiagnose".i18n(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    const VerticalSpace(height: 5.0),
                    Text(
                      _diagnose,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const VerticalSpace(height: 15.0),
                    Text(
                      "txtScore".i18n(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    const VerticalSpace(height: 5.0),
                    Text(
                      _precaModel.bmiValue != null ? _precaModel.bmiValue!.toString() : "txtPressCalc".i18n(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const VerticalSpace(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        _estimatePercentile(context);
                        // percentile 5 to < percentil 85 => 100
                        if (_percentilValue < 85) {
                          _precaModel.bmiValue = 100;
                          // percentile 85  to < percentil 95 => 70
                        } else if (_percentilValue < 97) {
                          _precaModel.bmiValue = 70;
                          // percentile 97 to < 120% of percentile 97 => 30
                          // 120% of percentil 97 to < 140% of percentile 97 => 15
                          // ≥ 140% of percentile 97 => 0
                        } else {
                          _precaModel.bmiValue = getScoreOver97();
                          debugPrint("Score over 97: ${_precaModel.bmiValue.toString()}");
                          // _precaModel.notifyListeners();
                        }
                        _precaModel.calculateAverage();
                      },
                      child: Text("txtCalculate".i18n()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _precaModel.bmiValue = null;
                            Navigator.of(context).pop();
                          },
                          child: Text("txtCancel".i18n()),
                        ),
                        const SizedBox(width: 10.0),
                        // Accept button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("txtAccept".i18n()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("txtTradNotLaded".i18n()),
        duration: const Duration(days: 1),
        action: SnackBarAction(
          label: "txtDone".i18n(),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  String _determineDiagnose(int percentile) {
    /*
    overweight (>85th percentile and <95th percentile) and obesity (>95th percentile) and severe obesity (>99th percentile) .
    Therefore, for the PRECARINA application, we trained a Machine Learning model with data from the World Health Organization (
    WHO) and the National Center for Health to estimate the BMI percentile.
     */

    if (percentile > 99) {
      return "txtSevereObesity".i18n();
    } else if (percentile > 95) {
      return "txtObesity".i18n();
    } else if (percentile > 85) {
      return "txtOverWeight".i18n();
    } else {
      return "txtNormalWeight".i18n();
    }
  }

  int? getScoreOver97() {
    // Convert age from years-months to years-fraction of years as digitalized from the curves
    // Although curves' x axis are year and months it was much easier to measure as franctions of years
    double age = _precaModel.ageYears! + _precaModel.ageMonths! / 12;
    // No let's get the BMI for 97% at said age
    // According to the regression, fot 97%: bmi = -0.008237121887635776 age^3 +  0.28450418735930744 age^2 -2.1290147029215354 age + 23.20470735832494   (R^2 = 0.9996795012472375)

    double bmi97 = -0.008237121887635776 * pow(age, 3) + 0.28450418735930744 * pow(age, 2) - 2.1290147029215354 * age + 23.20470735832494;

    // percentile 97 to < 120% of percentile 97 => 30
    // 120% of percentil 97 to < 140% of percentile 97 => 15
    // ≥ 140% of percentile 97 => 0

    if (_percentilValue < bmi97 * 1.2) {
      return 30;
    }
    if (_percentilValue < bmi97 * 1.4) {
      return 15;
    } else {
      return 0;
    }
  }
}
