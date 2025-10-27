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

  final _blocksToSchoolController = TextEditingController();
  final TextEditingController _weeklyMinsOfActController =
      TextEditingController();
  final TextEditingController _dailyMinsOfScreenController =
      TextEditingController();

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
  void dispose() {
    _blocksToSchoolController.dispose();
    _weeklyMinsOfActController.dispose();
    _dailyMinsOfScreenController.dispose();
    super.dispose();
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
            _buildRadioGroup(
              groupValue: _daysWithPhysicalActivity,
              onChanged: physicalActiveDaysChoice,
              options: [
                l10n.physicalActivityQ1Opt1,
                l10n.physicalActivityQ1Opt2,
                l10n.physicalActivityQ1Opt3,
                l10n.physicalActivityQ1Opt4,
                l10n.physicalActivityQ1Opt5,
                l10n.physicalActivityQ1Opt6,
                l10n.physicalActivityQ1Opt7,
                l10n.physicalActivityQ1Opt8,
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
                  _buildNumericInput(
                    fieldKey: _weeklyMinsOfActivityKey,
                    name: "WeeklyMinsOfActivity",
                    controller: _weeklyMinsOfActController,
                    maxLength: 3,
                    width: 55.0,
                    validator: (val) =>
                        !disableQ2 && (val == null || val.isEmpty)
                            ? l10n.txtRequired
                            : null,
                    onChanged: (value) => setState(() =>
                        _weeklyMinsOfActValue = int.tryParse(value ?? '') ?? 0),
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
            _buildRadioGroup(
              groupValue: _transpToSchoolTypeValue,
              onChanged: onPickTransport,
              options: [
                l10n.physicalActivityQ3Opt1,
                l10n.physicalActivityQ3Opt2,
                l10n.physicalActivityQ3Opt3,
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
                  _buildNumericInput(
                    fieldKey: _blocksToSchoolKey,
                    name: "BlocksToSchool",
                    controller: _blocksToSchoolController,
                    maxLength: 2,
                    width: 45.0,
                    validator: (val) =>
                        !disableQ4 && (val == null || val.isEmpty)
                            ? l10n.txtRequired
                            : null,
                    onChanged: (value) => setState(() =>
                        _blocksToSchoolValue = int.tryParse(value ?? '') ?? 0),
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
            _buildRadioGroup(
              groupValue: _classesPerWeekValue,
              onChanged: daysOfPaClasses,
              options: [
                l10n.physicalActivityQ5Opt0,
                l10n.physicalActivityQ5Opt1,
                l10n.physicalActivityQ5Opt2,
                l10n.physicalActivityQ5Opt3,
                l10n.physicalActivityQ5Opt4,
                l10n.physicalActivityQ5Opt5,
                l10n.physicalActivityQ5Opt6,
              ],
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
                _buildNumericInput(
                  fieldKey: _dailyMinsOfScreenKey,
                  name: "DailyMinsOfScreen",
                  controller: _dailyMinsOfScreenController,
                  maxLength: 3,
                  width: 55.0,
                  onChanged: (value) => setState(() =>
                      _dailyMinsOfScreenValue = int.tryParse(value ?? '') ?? 0),
                ),
                Text(l10n.physicalActivityMinutes),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void daysOfPaClasses(int? value) {
    if (value != null && value != _classesPerWeekValue) {
      setState(() {
        _classesPerWeekValue = value;
      });
    }
  }

  void onPickTransport(int? value) {
    if (value != null && value != _transpToSchoolTypeValue) {
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
  }

  void physicalActiveDaysChoice(int? value) {
    FocusScope.of(context).unfocus();
    if (value != null && value != _daysWithPhysicalActivity) {
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
        double factor = (precaModel.ageYears ?? 0) > 14 ? 14.5 : 13.0;
        tate = (10 * ((_blocksToSchoolValue / factor) * 60) / 7).truncate();
        break;
      default:
        break;
    }

    debugPrint("TATE: $tate");

    // Tiempo clases educación física en minutos diarios
    // Duración de la clase según nivel educativo = primario (45 minutos) o secundario (60 minutos)
    int tef = (weeklyClases * ((precaModel.ageYears ?? 0) > 13 ? 60 : 45) / 7)
        .truncate();
    debugPrint("TEF: $tef");

    // Promedio diario total en minutos
    int totalMinutes = tad + tate + tef;

    // Consideramos el ideal 45 minutos diarios (score 100)

    precaModel.physicalActivityValue = (100 * totalMinutes / 45.0).truncate();

    if ((precaModel.physicalActivityValue ?? 0) > 100) {
      precaModel.physicalActivityValue = 100;
    }

    // Si pasa más de 120 minutos en la compu el snackbar es rojo
    return _dailyMinsOfScreenValue >= 120 ? true : false;
  }

  /// Builds a radio group using `ToggleButtons` for single selection.
  ///
  /// The `groupValue` determines which option is currently selected.
  /// The `onChanged` callback is triggered when a new option is selected,
  /// providing the index of the newly selected option.
  /// The `options` list provides the text labels for each radio button.

  Widget _buildRadioGroup({
    required int groupValue,
    required ValueChanged<int?> onChanged,
    required List<String> options,
  }) {
    return ToggleButtons(
      direction: Axis.vertical,
      isSelected: List.generate(options.length, (index) => index == groupValue),
      onPressed: (int index) {
        onChanged(index);
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      constraints: BoxConstraints(
        minHeight: 40.0,
        minWidth: MediaQuery.of(context).size.width -
            32, // Adjust width to fill space
      ),
      children: options
          .map((option) => Text(option, textAlign: TextAlign.center))
          .toList(),
    );
  }

  Widget _buildNumericInput({
    required GlobalKey<FormFieldState<String>> fieldKey,
    required String name,
    required TextEditingController controller,
    required int maxLength,
    required double width,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FormBuilderTextField(
        key: fieldKey,
        name: name,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        onTap: () => fieldKey.currentState?.reset(),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        maxLength: maxLength,
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
      ),
    );
  }
}
