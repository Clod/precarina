import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
// import 'package:localization/localization.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:precarina/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:time_machine/time_machine.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:precarina/l10n/app_localizations.dart';

import 'model/precarina_model.dart';

// Keys for testing, ensuring consistency with app_test.dart
const Key heightInputKey = Key('height_input_field');
const Key weightKilosInputKey = Key('weight_kilos_input_field');
const Key weightGramsInputKey = Key('weight_grams_input_field');
const Key ageYearsDropdownKey = Key('age_years_dropdown');
const Key ageMonthsDropdownKey = Key('age_months_dropdown');
const Key genderFemaleRadioKey = Key('gender_female_radio');
const Key genderMaleRadioKey = Key('gender_male_radio');
const Key calculateButtonKey = Key('calculate_button');
// const Key resetButtonKey = Key('reset_button'); // Example if you want to test reset

final dateFormat = DateFormat('dd-MM-yyyy');

class InputDataPage extends StatefulWidget {
  const InputDataPage({
    super.key,
  });

  @override
  State<InputDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<InputDataPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _heightKey = GlobalKey<FormFieldState<String>>();

  List<int> yearsRange = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17
  ];
  List<int> monthsRange = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  late DateTime _dateTime;
  late DateTime _currentDate;
  PatientSex? _selectedOption;
  bool _showSexError = false;
  final TextEditingController _textContAltura = TextEditingController();
  final TextEditingController _textContKilos = TextEditingController();
  final TextEditingController _textContGramos = TextEditingController();

  var heightMaskFormatter = MaskTextInputFormatter(
      mask: '###,#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  var kilosWeightMaskFormatter = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  var gramsWeightMaskFormatter = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  var ageYearsMaskFormatter = MaskTextInputFormatter(
      mask: '##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  var ageMonthsMaskFormatter = MaskTextInputFormatter(
      mask: '##',
      filter: {"#": RegExp(r'^[0-9]{1,2}$')},
      type: MaskAutoCompletionType.eager);

  // String? _heightError;
  final _heightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _currentDate = DateTime(_dateTime.year, _dateTime.month, _dateTime.day);
  }

  @override
  void dispose() {
    _textContAltura.dispose();
    _textContKilos.dispose();
    _textContGramos.dispose();
    _heightFocusNode.dispose();
    // _textContAnios and _textContMeses were removed as they were unused.
    super.dispose();
  }

  calcularEdad(DateTime nacimiento) {
    // Duration parse = nacimiento.difference(DateTime.now()).abs();
    return "";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != _currentDate) {
      setState(() {
        _dateTime = pickedDate;
        LocalDateTime a = LocalDateTime.now();
        LocalDateTime b = LocalDateTime.dateTime(pickedDate);
        Period diff = a.periodSince(b);
        _formKey.currentState?.fields['Age Years']
            ?.setValue(diff.years); //value(diff.years);
        _formKey.currentState?.fields['Age Months']?.setValue(diff.months);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var precaModel = Provider.of<PrecarinaModel>(context);
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: true,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 110.0,
                      width: 110.0,
                      child: Image.asset(
                        'assets/images/socaba_redondo.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse('https://www.socaba.net'));
                      },
                      child: const Text(
                        'Sociedad de Cardiología\nde Buenos aires',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(children: [
                  SizedBox(
                    height: 110.0,
                    width: 110.0,
                    child: Image.asset(
                      'assets/images/hospital_gutierrez.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(
                          'https://buenosaires.gob.ar/salud/hospital-de-ninos-dr-ricardo-gutierrez'));
                    },
                    child: const Text(
                      'Hospital de Niños\nRicardo Gutiérrez',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ])
              ],
            ),
            const VerticalSpace(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                l10n.patientsDataInputTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              l10n.inputSex,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            _buildSexToggleButtons(l10n),
            if (_showSexError)
              Text(
                l10n.txtRequired,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                l10n.inputHeight,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: _buildNumericInputField(
                testKey: heightInputKey,
                formFieldKey: _heightKey,
                name: "HeightKey",
                controller: _textContAltura,
                hintText: l10n.hintHeight,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  heightMaskFormatter
                ],
                validator: (val) =>
                    val == null || val.isEmpty ? l10n.txtRequired : null,
                focusNode: _heightFocusNode,
                onTap: () => _heightKey.currentState?.reset(),
                suffixText: "cm",
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                l10n.inputWeight,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNumericInputField(
                  testKey: weightKilosInputKey,
                  name: "WeightKilos",
                  controller: _textContKilos,
                  hintText: l10n.hintWeightKilos,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    kilosWeightMaskFormatter
                  ],
                  validator: (val) =>
                      val == null || val.isEmpty ? l10n.txtRequired : null,
                  suffixText: "Kg",
                ),
                const SizedBox(
                  width: 10.0,
                ),
                _buildNumericInputField(
                  testKey: weightGramsInputKey,
                  name: "WeightGrams",
                  controller: _textContGramos,
                  hintText: l10n.hintWeightGramos,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    gramsWeightMaskFormatter
                  ],
                  validator: (val) =>
                      val == null || val.isEmpty ? l10n.txtRequired : null,
                  suffixText: "g",
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                l10n.inputBirthDate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      l10n.birthDate,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: KeyedSubtree(
                      key: ageYearsDropdownKey,
                      child: FormBuilderDropdown(
                        iconEnabledColor: Colors.blue,
                        dropdownColor: Colors.yellow[50],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.yellow[100],
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: const OutlineInputBorder(),
                          labelText: l10n.labelYears,
                        ),
                        name: "Age Years",
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: l10n.txtRequired),
                          ],
                        ),
                        // Remove error message when user selects an option
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        items: yearsRange
                            .map(
                              (age) => DropdownMenuItem(
                                value: age,
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  age.toString() +
                                      (age == 0 || age == 1
                                          ? l10n.suffixAno
                                          : l10n.suffixAnos),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: KeyedSubtree(
                      key: ageMonthsDropdownKey,
                      child: FormBuilderDropdown(
                        iconEnabledColor: Colors.blue,
                        dropdownColor: Colors.yellow[50],
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.yellow[100],
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: const OutlineInputBorder(),
                          labelText: l10n.labelMonths,
                        ),
                        name: "Age Months",
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: l10n.txtRequired),
                          ],
                        ),
                        // Remove error message when user selects an option
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        items: monthsRange
                            .map(
                              (months) => DropdownMenuItem(
                                value: months,
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  months.toString() +
                                      (months == 0 || months == 1
                                          ? l10n.suffixMes
                                          : l10n.suffixMeses),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    _resetearValores(context);
                  },
                  child: Text(
                    l10n.btnResetFields,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  key: calculateButtonKey,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    // Let's give some time for the keyboard to fade away, otherwise
                    // a layout error is shown in Andorid because in the following screen
                    // there is not enough room for all the widgets and the keybard
                    // await Future.delayed(const Duration(seconds: 1));

                    if (_formKey.currentState?.validate() == true) {
                      // If decimals were ommitted complete with 0
                      if (_textContAltura.text.endsWith(',')) {
                        _textContAltura.text = '${_textContAltura.text}0';
                      }
                      // Let's change the comma to a period
                      final String heightText =
                          _textContAltura.text.replaceAll(",", ".");
                      precaModel.height = double.tryParse(heightText);
                      precaModel.weightKilos =
                          int.tryParse(_textContKilos.text);
                      precaModel.weightGrams =
                          int.tryParse(_textContGramos.text);

                      // Defensive check, although validators should prevent this.
                      if (precaModel.height == null ||
                          precaModel.weightKilos == null ||
                          precaModel.weightGrams == null) {
                        // Optionally show an error to the user
                        return;
                      }

                      precaModel.ageYears =
                          _formKey.currentState?.fields['Age Years']?.value;
                      precaModel.ageMonths =
                          _formKey.currentState?.fields['Age Months']?.value;

                      precaModel.dateOfBirth = _dateTime;
                      precaModel.patientSex = _selectedOption;

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        if (_selectedOption == null) {
                          _showSexError = true;
                        } else {
                          _showSexError = false;
                        }
                      });
                    }
                  },
                  child: Text(
                    l10n.btnContinue,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSexToggleButtons(AppLocalizations l10n) {
    // Define the order of sexes to match the button layout.
    // This makes the logic independent of the enum's definition order.
    final sexOptions = [PatientSex.female, PatientSex.male];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ToggleButtons(
        isSelected: [
          _selectedOption == PatientSex.female,
          _selectedOption == PatientSex.male,
        ],
        onPressed: (int index) {
          final selectedSex = PatientSex.values[index];
          if (_selectedOption != selectedSex) {
          // Use the local `sexOptions` list to get the correct value.
          final newlySelectedSex = sexOptions[index];
          if (_selectedOption != newlySelectedSex) {
            setState(() {
              _selectedOption = selectedSex;
              _selectedOption = newlySelectedSex;
              _showSexError = false;
            });
          }
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.blue,
        selectedColor: Colors.white,
        fillColor: Colors.blue,
        color: Colors.blue,
        constraints: BoxConstraints(
          minHeight: 40.0,
          minWidth: (MediaQuery.of(context).size.width - 48) / 2,
        ),
        children: [
          // Use a KeyedSubtree if you need to find the specific Text widget in tests
          KeyedSubtree(key: genderFemaleRadioKey, child: Text(l10n.sexFemale)),
          KeyedSubtree(key: genderMaleRadioKey, child: Text(l10n.sexMale)),
        ],
      ),
    );
  }

  Widget _buildNumericInputField({
    Key? testKey,
    GlobalKey<FormFieldState<String>>? formFieldKey,
    required String name,
    required TextEditingController controller,
    required String hintText,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    FocusNode? focusNode,
    VoidCallback? onTap,
    required String suffixText,
  }) {
    final field = FormBuilderTextField(
      // Use the formFieldKey for state access, or the testKey if it's a ValueKey for the widget itself
      key: formFieldKey ?? testKey,
      name: name,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
      ),
      validator: validator,
      onTap: onTap,
    );

    // Wrap in KeyedSubtree only if a separate testKey is provided for finding the wrapper
    final Widget inputWidget = (testKey != null && formFieldKey != null)
        ? KeyedSubtree(key: testKey, child: field)
        : field;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              width: 100.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.yellow[100],
              ),
            ),
            SizedBox(
              width: 100.0,
              child: inputWidget,
            ),
          ],
        ),
        Text(
          " $suffixText",
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _resetearValores(BuildContext context) {
    setState(() {
      _formKey.currentState?.reset();
      _textContAltura.text = '';
      _textContKilos.text = '';
      _textContGramos.text = '';
      _formKey.currentState?.fields['Age Years']?.setValue(null);
      _formKey.currentState?.fields['Age Months']?.setValue(null);
      _dateTime = DateTime.now();
      _selectedOption = null;
      _showSexError = false;
    });
  }
}
