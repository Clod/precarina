import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/localization.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

import '../aux_functions/lose_input_warning.dart';
import '../aux_functions/search_blood_pressure_percentile.dart';
import '../aux_functions/show_blood_pressure_warning.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_drawer.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({super.key});

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  final _controllerHeight = TextEditingController();
  final _controllerSex = TextEditingController();
  final _controllerAge = TextEditingController();
  final _controllerSistAP = TextEditingController();
  final _controllerDiastPA = TextEditingController();

  var precaModel = PrecarinaModel();

  late BuildContext bc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showWarning(bc));
  }

  @override
  Widget build(BuildContext context) {
    precaModel = Provider.of<PrecarinaModel>(context);

    bc = context;
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // title: Text(AppLocalizations.of(context)!.txtBloodPressureButton),
          title: Text("txtBloodPressureButton".i18n()),
        ),
        drawer: const HelpDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex:2,
                child: PagesHeader(),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Sexo (v/m):      "),
                                  Expanded(
                                    child: TextField(
                                      controller: _controllerSex,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Edad en años:   "),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _controllerAge,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Altura en cm:   "),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      controller: _controllerHeight,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("PA Sistólica:   "),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _controllerSistAP,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("PA Distólica:   "),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _controllerDiastPA,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                child: const Text("Calcular"),
                                onPressed: () {
                                  String resultado;
                                  PatientSex ps = (_controllerSex.text == "V" || _controllerSex.text == "v") ? PatientSex.male : PatientSex.female;
                                  resultado = searchBloodPresurePercentiles(
                                    sex: ps,
                                    height: double.parse(_controllerHeight.text.replaceAll(",", ".")),
                                    age: int.parse(_controllerAge.text),
                                    sistBP: int.parse(_controllerSistAP.text),
                                    diastBP: int.parse(_controllerDiastPA.text),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(resultado),
                                      duration: const Duration(days: 1),
                                      action: SnackBarAction(
                                        label: 'Listo',
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(AppLocalizations.of(context)!.txtButtonCancel),
                            onPressed: () => Navigator.maybePop(context),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              precaModel.dietValue = int.parse(_controllerHeight.value.text);
                              debugPrint("Diet Value en Screen: ${precaModel.dietValue}");
                              precaModel.calculateAverage();
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context)!.txtButtonAccept),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
