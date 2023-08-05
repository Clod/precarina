import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
  final _controllerSex = TextEditingController();
  final _controllerSistAP = TextEditingController();
  final _controllerDiastPA = TextEditingController();
  var bpFormatter = MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  var precaModel = PrecarinaModel();

  String pasHint = "Ej.: 120";
  String padHint = "Ej.: 80";

  List<String> results = ["", ""];
  String diagnose = "";
  String score = "";

  @override
  void initState() {
    super.initState();
    // This callback will get called AFTER the Widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showWarning(context);
      precaModel = Provider.of<PrecarinaModel>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: FormBuilder(
            key: _formKey,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const VerticalSpace(altura: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("PA Sistólica:   "),
                            Stack(
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: FormBuilderTextField(
                                    name: "PAS",
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, bpFormatter],
                                    controller: _controllerSistAP,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: pasHint,
                                      border: InputBorder.none,
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.blue),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                    ),
                                    onTap: () {
                                      _formKey.currentState?.fields['PAS']?.reset();
                                    },
                                    validator: FormBuilderValidators.compose(
                                      [
                                        (val) {
                                          debugPrint("Validando");
                                          return val!.isEmpty ? 'Requerido' : null;
                                        },
                                        FormBuilderValidators.required(errorText: "     Requerido"),
                                        FormBuilderValidators.numeric(),
                                        // FormBuilderValidators.max(70),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(" mmHg"),
                          ],
                        ),
                        const VerticalSpace(altura: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("PA Distólica:   "),
                            Stack(
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: FormBuilderTextField(
                                    name: 'PAD',
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, bpFormatter],
                                    controller: _controllerDiastPA,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: padHint,
                                      border: InputBorder.none,
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.blue),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                    ),
                                    onTap: () {
                                      _formKey.currentState?.fields['PAD']?.reset();
                                    },
                                    validator: FormBuilderValidators.compose(
                                      [
                                        (val) {
                                          debugPrint("Validando");
                                          return val!.isEmpty ? 'Requerido' : null;
                                        },
                                        FormBuilderValidators.required(errorText: "     Requerido"),
                                        FormBuilderValidators.numeric(),
                                        // FormBuilderValidators.max(70),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(" mmHg"),
                          ],
                        ),
                        const VerticalSpace(altura: 20.0),
                        SizedBox(
                          width: 200.0,
                          child: FormBuilderChoiceChip<String>(
                            name: 'Medicado',
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            labelStyle: const TextStyle(fontSize: 25.0),
                            // initialValue: "N/I",
                            decoration: const InputDecoration(
                              isDense: true,
                              label: Text(
                                "Recibe medicación",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              border: OutlineInputBorder(),
                            ),
                            alignment: WrapAlignment.spaceAround,
                            options: const [
                              FormBuilderChipOption(value: "S"),
                              FormBuilderChipOption(value: "N"),
                            ],
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(errorText: "     Requerido"),
                              ],
                            ),
                            selectedColor: Colors.blueAccent,
                            onChanged: (value) {
                              // _formKey.currentState!.fields['Medicado']?.reset();
                              _formKey.currentState!.fields['Medicado']?.validate();
                            },
                          ),
                        ),
                        const VerticalSpace(altura: 15.0),
                        ElevatedButton(
                          child: const Text("Calcular"),
                          onPressed: () {
                            if (_formKey.currentState!.validate() == true) {
                              FocusScope.of(context).unfocus();
                              PatientSex ps = (_controllerSex.text == "V" || _controllerSex.text == "v") ? PatientSex.male : PatientSex.female;
                              results = searchBloodPresurePercentiles(
                                sex: precaModel.patientSex == PatientSex.female ? PatientSex.female : PatientSex.male,
                                height: precaModel.height!,
                                age: precaModel.ageYears!,
                                sistBP: int.parse(_controllerSistAP.text),
                                diastBP: int.parse(_controllerDiastPA.text),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(results[1]),
                                  duration: const Duration(days: 1),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      setState(() {
                                        diagnose = results[0];
                                        score = calculateScore(diagnose, _formKey.currentState!.fields['Medicado']?.value);
                                      });
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        const VerticalSpace(altura: 15.0),
                        Text(
                          diagnose,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        Text(
                          score,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Text(AppLocalizations.of(context)!.txtButtonCancel),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                Navigator.maybePop(context);
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                debugPrint("BP value en Screen: ${precaModel.bloodPressureValue}");
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
      ),
    );
  }

  String calculateScore(String diagnose, value) {
    int score = 0;

    switch (diagnose) {
      case "Paciente normotenso":
        score = 100;
      case "Paciente prehipertenso":
        score = 66;
      case "Paciente hipertenso leve":
        score = 33;
      case "Paciente hipertenso severo":
        score = 0;
    }

    if (score >= 20) score -= 20;

    precaModel.bloodPressureValue = score;

    return "Score: $score";
  }
}
