import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

import 'package:precarina/aux_functions/lose_input_warning.dart';
import 'package:precarina/aux_functions/search_blood_pressure_percentile_db.dart';
import 'package:precarina/aux_functions/show_blood_pressure_warning.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:precarina/help_pages/help_drawer.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({super.key});

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}
/*

"txtExamplePAS".i18n() = "Ej.: 120";
"txtExamplePAD".i18n() = "Ej.: 80";
"txtPAS".i18n() = "PA Sistólica: ";
"txtPAD".i18n() = "PA Distólica: ";
"txtReceivesMEdication".i18n() = "Recibe medicación";
"txtRequired".i18n() = " Requerido";
"txtCalculate".i18n() = "Calcular";
"txtOK".i18n() = "OK";
"txtCancel".i18n() = "Cancelar";
"txtAccept".i18n() = "Aceptar";
"txtPatientNormal".i18n() = "Paciente normotenso";
"txtPatHT".i18n() = "Paciente prehipertenso";
"txtPatHt1".i18n() = "Paciente hipertenso leve";
"txtPatHt2".i18n() = "Paciente hipertenso severo";
"txtYes".i18n() = "S";
"txtNo".i18n() = "N";
"txtScore".i18n() = "Score: ";

*/

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  // final _controllerSex = TextEditingController();
  final _controllerSistAP = TextEditingController();
  final _controllerDiastPA = TextEditingController();
  var bpFormatter = MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  var _precaModel = PrecarinaModel();

  final String _pasHint = "txtExamplePAS".i18n();
  final String _padHint = "txtExamplePAD".i18n();

  List<String> _results = ["", ""];
  String _diagnose = "";
  String _score = "";

  // I cannot enable accept button until the SnackBar
  bool _acceptButtonDisabled = true;

  bool _cancelButtonDisabled = false;

  @override
  void initState() {
    super.initState();

    // This callback will get called AFTER the Widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return; // Add mounted check
      showWarning(context);
      if (!mounted) return; // Guard context use with mounted check
      _precaModel = Provider.of<PrecarinaModel>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

    // double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: Text(AppLocalizations.of(context)!.txtBloodPressureButton),
        title: Text("txtBloodPressureButton".i18n()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => showInputLostWarning(context),
        ),
      ),
      drawer: const HelpDrawer(),
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalSpace(height: (15.0 + height / 4)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("txtPAS".i18n()),
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  bpFormatter
                                ],
                                controller: _controllerSistAP,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: _pasHint,
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
                                      return val!.isEmpty
                                          ? 'txtRequired'.i18n()
                                          : null;
                                    },
                                    FormBuilderValidators.required(
                                        errorText: "     Requerido"),
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
                    const VerticalSpace(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("txtPAD".i18n()),
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  bpFormatter
                                ],
                                controller: _controllerDiastPA,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: _padHint,
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
                                    FormBuilderValidators.required(
                                        errorText: "     Requerido"),
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
                    const VerticalSpace(height: 20.0),
                    SizedBox(
                      width: 200.0,
                      child: FormBuilderChoiceChip<String>(
                        name: 'Medicado',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelStyle: const TextStyle(fontSize: 25.0),
                        // initialValue: "N/I",
                        decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "txtReceivesMedication".i18n(),
                            style: const TextStyle(fontSize: 20.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          border: const OutlineInputBorder(),
                        ),
                        alignment: WrapAlignment.spaceAround,
                        options: [
                          FormBuilderChipOption(value: "txtYes".i18n()),
                          FormBuilderChipOption(value: "txtNo".i18n()),
                        ],
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: "     Requerido"),
                          ],
                        ),
                        selectedColor: Colors.blueAccent,
                        onChanged: (value) {
                          // _formKey.currentState!.fields['Medicado']?.reset();
                          _formKey.currentState!.fields['Medicado']?.validate();
                        },
                      ),
                    ),
                    const VerticalSpace(height: 15.0),
                    // Trigger interpolation button
                    ElevatedButton(
                      child: Text("txtCalculate".i18n()),
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == true) {
                          // I will not enable cancellation until SnackBar gets dismissed
                          _cancelButtonDisabled = true;
                          _acceptButtonDisabled = true;
                          debugPrint("Escuendo el teclado");
                          FocusScope.of(context).unfocus();
                          // PatientSex ps = (_controllerSex.text == "V" || _controllerSex.text == "v") ? PatientSex.male : PatientSex.female;
                          debugPrint("Llamo a la función");
                          
                          // Store the BuildContext before async operation
                          final scaffoldContext = context;
                          
                          _results = await searchBloodPressurePercentiles(
                            sex: _precaModel.patientSex == PatientSex.female
                                ? PatientSex.female
                                : PatientSex.male,
                            height: _precaModel.height!,
                            age: _precaModel.ageYears!,
                            systBP: int.parse(_controllerSistAP.text),
                            diastBP: int.parse(_controllerDiastPA.text),
                          );

                          // Check if State is still mounted
                          if (!mounted) return;
                          
                          // Check if the BuildContext is still mounted
                          if (!scaffoldContext.mounted) return;
                          
                          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                            SnackBar(
                              content: Text(_results[1]),
                              duration: const Duration(days: 1),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Store the BuildContext before using it
                                  final btnContext = context;
                                  
                                  if (!mounted) return; // Check if State is still mounted
                                  
                                  _cancelButtonDisabled = false;
                                  _acceptButtonDisabled = false;
//                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  
                                  // Check if the BuildContext is still mounted
                                  if (!btnContext.mounted) return;
                                  
                                  ScaffoldMessenger.of(btnContext)
                                      .removeCurrentSnackBar();
                                  setState(() {
                                    _diagnose = _results[0];
                                    _score = calculateScore(
                                        _diagnose,
                                        _formKey.currentState!
                                            .fields['Medicado']?.value);
                                  });
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const VerticalSpace(height: 15.0),
                    Text(
                      _diagnose,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    const VerticalSpace(height: 5.0),
                    Text(
                      _score,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    const VerticalSpace(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cancel Button
                        ElevatedButton(
                          onPressed: _cancelButtonDisabled
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  Navigator.maybePop(context);
                                },
                          child: Text(
                              AppLocalizations.of(context)!.txtButtonCancel),
                        ),
                        const HorizontalSpace(width: 15.0),
                        // Accept
                        ElevatedButton(
                          onPressed: _acceptButtonDisabled
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  debugPrint(
                                      "BP value en Screen: ${_precaModel.bloodPressureValue}");

                                  RegExp regExp = RegExp(r"Score: (\d+)");

                                  Match? match = regExp.firstMatch(_score);
                                  String digitsString = match!.group(1)!;
                                  int scoreInt = int.parse(digitsString);

                                  _precaModel.bloodPressureValue = scoreInt;
                                  _precaModel.calculateAverage();
                                  Navigator.of(context).pop();
                                },
                          child: Text(
                              AppLocalizations.of(context)!.txtButtonAccept),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 4,
                child: const PagesHeader(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calculateScore(String diagnose, String medicado) {
    int score = 0;

    if (_precaModel.ageYears! < 16) {
      if (diagnose == "patientDiagnoseNorm".i18n()) {
        score = 100;
      } else if (diagnose == "patientDiagnoseHT".i18n()) {
        score = 66;
      } else if (diagnose == "patientDiagnoseHT1".i18n()) {
        score = 33;
      } else if (diagnose == "patientDiagnoseHT2".i18n()) {
        score = 0;
      } else {
        score = 0;
      }
    } else {
      if (diagnose == "patientDiagnoseNorm".i18n()) {
        score = 100;
      } else if (diagnose == "patientDiagnoseHT".i18n()) {
        score = 75;
      } else if (diagnose == "patientDiagnoseHT1".i18n()) {
        score = 50;
      } else if (diagnose == "patientDiagnoseHT2".i18n()) {
        score = 25;
      } else {
        score = 0;
      }
    }

    if (medicado == "txtYes".i18n() && score >= 20) score -= 20;

    _precaModel.bloodPressureValue = score;

    return "txtScore".i18n() + score.toString();
  }
}
