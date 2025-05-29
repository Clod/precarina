import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:precarina/l10n/app_localizations.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

class PhysicalActivitySurvey extends StatefulWidget {
  const PhysicalActivitySurvey({super.key});

  @override
  PhysicalActivitySurveyState createState() => PhysicalActivitySurveyState();
}

class PhysicalActivitySurveyState extends State<PhysicalActivitySurvey> {
  var precaModel = PrecarinaModel();

  int _daysWithPhysicalActivity = 0;
  int _weeklyMinsOfActValue = 0;
  int _transpToSchoolTypeValue = 2;
  int _blocksToSchoolValue = 0;
  int _classesPerWeekValue = 1;
  int _dailyMinsOfScreenValue = 0;
  TextEditingController p6Controller = TextEditingController();
  final TextEditingController _blocksToSchoolController = TextEditingController();
  final TextEditingController _weeklyMinsOfActController = TextEditingController();
  final TextEditingController _dailyMinsOfScreenController = TextEditingController();

  final _weeklyMinsOfActivityKey = GlobalKey<FormFieldState<String>>();
  final _blocksToSchoolKey = GlobalKey<FormFieldState<String>>();
  final _dailyMinsOfScreenKey = GlobalKey<FormFieldState<String>>();

  final formKey = GlobalKey<FormBuilderState>();

  bool disableQ2 = true;
  bool disableQ4 = true;

  @override
  void initState() {
    super.initState();
    precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.physicalActivityQ1,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              l10n.physicalActivityQ1Note,
              style: const TextStyle(fontSize: 12),
            ),
            const VerticalSpace(height: 8),
            Column(
              children: [
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt1),
                  value: 0, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt2),
                  value: 1, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt3),
                  value: 2, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt4),
                  value: 3, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt5),
                  value: 4, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt6),
                  value: 5, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt7),
                  value: 6, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ1Opt8),
                  value: 7, // Assuming this value corresponds to the localized string
                  groupValue: _daysWithPhysicalActivity,
                  onChanged: physicalActiveDaysChoice,
                ),
              ],
            ),
            const VerticalSpace(height: 16),
            Text(
              l10n.physicalActivityQ2,
              style: TextStyle(
                fontSize: 18,
                color: (disableQ2 ? Colors.black38 : Colors.black87),
              ),
            ),
            const VerticalSpace(height: 8),
            AbsorbPointer(
              absorbing: disableQ2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: FormBuilderTextField(
                      validator: (val) => !disableQ2 && val!.isEmpty ? l10n.txtRequired : null,
                      key: _weeklyMinsOfActivityKey,
                      name: "WeeklyMinsOfActivity",
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      controller: _weeklyMinsOfActController,
                      decoration: const InputDecoration(
                        counterText: '', // Hide the counter text
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value != null && value != "") {
                            debugPrint("el puto value: $value");
                            _weeklyMinsOfActValue = int.tryParse(value)!;
                          }
                        });
                      },
                      onTap: () {
                        _weeklyMinsOfActivityKey.currentState?.reset();
                      },
                    ),
                  ),
                  Text(
                    " mins.",
                    style: TextStyle(
                      fontSize: 18,
                      color: (disableQ2 ? Colors.black38 : Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpace(height: 16),
            Text(
              l10n.physicalActivityQ3,
              style: const TextStyle(fontSize: 18),
            ),
            const VerticalSpace(height: 8),
            Column(
              children: [
                RadioListTile(
                  title: Text(l10n.physicalActivityQ3Opt1),
                  value: 0, // Assuming this value corresponds to the localized string
                  groupValue: _transpToSchoolTypeValue,
                  onChanged: onPickTransport,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ3Opt2),
                  value: 1, // Assuming this value corresponds to the localized string
                  groupValue: _transpToSchoolTypeValue,
                  onChanged: onPickTransport,
                ),
                RadioListTile(
                  title: Text(l10n.physicalActivityQ3Opt3),
                  value: 2, // Assuming this value corresponds to the localized string
                  groupValue: _transpToSchoolTypeValue,
                  onChanged: onPickTransport,
                ),
              ],
            ),
            const VerticalSpace(height: 16),
            Text(
              l10n.physicalActivityQ4,
              style: TextStyle(
                fontSize: 18.0,
                color: (disableQ4 ? Colors.black38 : Colors.black87),
              ),
            ),
            const VerticalSpace(height: 8),
            AbsorbPointer(
              absorbing: disableQ4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: FormBuilderTextField(
                      validator: (val) => !disableQ4 && val!.isEmpty ? l10n.txtRequired : null,
                      key: _blocksToSchoolKey,
                      name: "BlocksToSchool",
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      controller: _blocksToSchoolController,
                      decoration: const InputDecoration(
                        counterText: '', // Hide the counter text
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value != null && value != "") _blocksToSchoolValue = int.tryParse(value)!;
                        });
                      },
                      onTap: () {
                        _blocksToSchoolKey.currentState?.reset();
                      },
                    ),
                  ),
                  Text(
                    l10n.physicalActivityBlocks,
                    style: TextStyle(
                      fontSize: 18,
                      color: (disableQ4 ? Colors.black38 : Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpace(height: 16),
            Text(
              l10n.physicalActivityQ5,
              style: const TextStyle(fontSize: 18),
            ),
            const VerticalSpace(height: 8),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt0),
              value: 0, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt1),
              value: 1, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt2),
              value: 2, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt3),
              value: 3, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt4),
              value: 4, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt5),
              value: 5, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            RadioListTile(
              title: Text(l10n.physicalActivityQ5Opt6),
              value: 6, // Assuming this value corresponds to the localized string
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
            ),
            const VerticalSpace(height: 16),
            Text(
              l10n.physicalActivityQ6,
              style: const TextStyle(fontSize: 18),
            ),
            const VerticalSpace(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 55.0,
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: FormBuilderTextField(
                    key: _dailyMinsOfScreenKey,
                    name: "DailyMinsOfScreen",
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    maxLength: 3,
                    controller: _dailyMinsOfScreenController,
                    decoration: const InputDecoration(
                      counterText: '', // Hide the counter text
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        (value != null && value != "") ? _dailyMinsOfScreenValue = (int.tryParse(value) ?? 0) : _dailyMinsOfScreenValue = 0;
                      });
                    },
                    onTap: () {
                      _dailyMinsOfScreenKey.currentState?.reset();
                    },
                  ),
                ),
                Text(l10n.physicalActivityMinutes),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void daysOfPaClasses(value) {
    setState(() {
      _classesPerWeekValue = value;
    });
  }

  void onPickTransport(value) {
    setState(() {
      _transpToSchoolTypeValue = value;
      if (_transpToSchoolTypeValue == 2) {
        disableQ4 = true;
        FocusScope.of(context).unfocus();
        _blocksToSchoolController.clear();
      } else {
        disableQ4 = false;
      }
    });
  }

  void physicalActiveDaysChoice(value) {
    FocusScope.of(context).unfocus();
    setState(() {
      _daysWithPhysicalActivity = value;
      if (_daysWithPhysicalActivity == 0) {
        disableQ2 = true;
        _weeklyMinsOfActController.clear();
      } else {
        disableQ2 = false;
      }
    });
  }

  /*

      TAFD (minutos/día) = TAD + TEF + TATE

correspondiendo:

TAD (minutos/día): tiempo de actividad deportiva diario promedio
TEF (minutos/día): tiempo de educación física diario promedio
TATE (minutos/día): tiempo de actividad física en el transporte escolar diario promedio

TAD, es definido a partir de las siguientes variables:
    P1 = días de práctica de deportes, juegos, ejercicios físicos, danza u otra actividad física
    P2a = tiempo en horas
    P2b = tiempo en minutos
    P2 = tiempo de sesión (minutos) = (P2a x 60) + P2b

TAD (minutos/día) = (P1 x P2) / 7
TEF, es definido a partir de las siguientes variables:
P5 = frecuencia semanal de clases de educación física
Duración de la clase según nivel educativo
(DNE) = primario (45 minutos) o secundario (60 minutos)

TEF (minutos/día) = (P5 x DNE) / 7

P4: P4 = distancia en km desde el domicilio a la escuela
  TATE (minutos/día) = (10 x((P4/4,32) x 60)) / 7
Para bicicleta (menores de 14 años):
TATE (minutos/día) = (10 x((P4/13) x 60)) / 7
Para bicicleta (14 y más años):
TATE (minutos/día) = (10 x((P4/14,5) x 60)) / 7
*/

  bool triggerCalculation() {
    debugPrint("Empezando con los cálculos");
    // Clases de Educación Física
    int weeklyClases = _classesPerWeekValue;
    debugPrint("Weekly classes: $weeklyClases");

    // Tiempo de actividad física en minutos diarios
    int tad = (_weeklyMinsOfActValue / 7).truncate();

    debugPrint("TAD: $tad");

    // Tiempo de transporte escolar en minutos diarios
    int tate = 0;

    switch (_transpToSchoolTypeValue) {
      case 0:
        tate = (10 * ((_blocksToSchoolValue / 43.2) * 60) / 7).truncate();
        break;
      case 1:
        double factor = precaModel.ageYears! > 14 ? 14.5 : 13.0;
        tate = (10 * ((_blocksToSchoolValue / factor) * 60) / 7).truncate();
        break;
      default:
        break;
    }

    debugPrint("TATE: $tate");

    // Tiempo clases educación física en minutos diarios
    // Duración de la clase según nivel educativo = primario (45 minutos) o secundario (60 minutos)
    int tef = (weeklyClases * (precaModel.ageYears! > 13 ? 60 : 45) / 7).truncate();
    debugPrint("TEF: $tef");

    // Promedio diario total en minutos
    int totalMinutes = tad + tate + tef;

    // Consideramos el ideal 45 minutos diarios (score 100)

    precaModel.physicalActivityValue = (100 * totalMinutes / 45.0).truncate();

    if (precaModel.physicalActivityValue! > 100) precaModel.physicalActivityValue = 100;

    // Si pasa más de 120 minutos en la compu el snackbar es rojo
    return _dailyMinsOfScreenValue >= 120 ? true : false;
  }
}
