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

// It's good practice to define keys in a shared constants file if used across app and test code.
// For this example, we'll use the string directly, assuming app_test.dart uses the same.
const Key heightInputKeyTest = Key('height_input_field');

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
  final _weightKilosKey = GlobalKey<FormFieldState<String>>();
  final _weightGramsKey = GlobalKey<FormFieldState<String>>();

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
  final TextEditingController _textContAnios = TextEditingController();
  final TextEditingController _textContMeses = TextEditingController();

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
        // debugPrint("years: ${diff.years}; months: ${diff.months}; days: ${diff.days}; hours: ${diff.hours}; minutes: ${diff.minutes}; seconds: ${diff.seconds}");
        _textContAnios.text = diff.years.toString();
        _textContMeses.text = diff.months.toString();
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.yellow[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.0,
                    child: RadioListTile(
                      title: Text(
                        l10n.sexFemale,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      value: PatientSex.female,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                          _showSexError = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    child: RadioListTile(
                      title: Text(
                        l10n.sexMale,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      value: PatientSex.male,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                          _showSexError = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
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
                      child: KeyedSubtree(
                        key: heightInputKeyTest, // Key for testing find.byKey()
                        child: FormBuilderTextField(
                          validator: (val) =>
                              val!.isEmpty ? l10n.txtRequired : null,
                          name: "HeightKey", // Name used by FormBuilder
                          key:
                              _heightKey, // GlobalKey for FormFieldState access (e.g., for reset)
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            heightMaskFormatter
                          ],
                          textAlign: TextAlign.center,
                          controller: _textContAltura,
                          focusNode: _heightFocusNode,
                          decoration: InputDecoration(
                            hintText: l10n.hintHeight,
                            border: InputBorder.none,
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                          ),
                          onTap: () {
                            _heightKey.currentState?.reset();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "  cm",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                      child: FormBuilderTextField(
                        validator: (val) =>
                            val!.isEmpty ? l10n.txtRequired : null,
                        key: _weightKilosKey,
                        name: "WeightKilos",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          kilosWeightMaskFormatter
                        ],
                        textAlign: TextAlign.center,
                        controller: _textContKilos,
                        decoration: InputDecoration(
                          hintText: l10n.hintWeightKilos,
                          border: InputBorder.none,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                        ),
                        onTap: () {
                          _weightKilosKey.currentState?.reset();
                        },
                      ),
                    ),
                  ],
                ),
                const Text(
                  "  Kg",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Stack(children: [
                  Container(
                    width: 100.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow[100],
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: FormBuilderTextField(
                      validator: (val) =>
                          val!.isEmpty ? l10n.txtRequired : null,
                      key: _weightGramsKey,
                      name: "WeightGrams",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        gramsWeightMaskFormatter
                      ],
                      textAlign: TextAlign.center,
                      controller: _textContGramos,
                      decoration: InputDecoration(
                        hintText: l10n.hintWeightGramos,
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
                        _weightGramsKey.currentState?.reset();
                      },
                    ),
                  ),
                ]),
                const Text(
                  "  g",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
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
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
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
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    // Let's give some time for the keyboard to fade away, otherwise
                    // a layout error is shown in Andorid because in the following screen
                    // there is not enough room for all the widgets and the keybard
                    // await Future.delayed(const Duration(seconds: 1));

                    if (_formKey.currentState?.validate() == true) {
                      // If decimals were ommitted complete with 0
                      if (RegExp(r',\s*$').hasMatch(_textContAltura.text)) {
                        _textContAltura.text += '0';
                      }
                      // Let's change the comma to a period
                      _textContAltura.text.replaceAll(",", ".");
                      debugPrint("Altura: ${_textContAltura.text}");
                      precaModel.height = double.parse(
                          _textContAltura.text.replaceAll(",", "."));
                      precaModel.weightKilos = int.parse(_textContKilos.text);
                      precaModel.weightGrams = int.parse(_textContGramos.text);
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

  _resetearValores(BuildContext context) {
    setState(() {
      _formKey.currentState?.reset();
      _textContAltura.text = '';
      _textContKilos.text = '';
      _textContGramos.text = '';
      // _textContAnios.text = '';
      // _textContMeses.text = '';
      _formKey.currentState?.fields['Age Years']?.setValue(null);
      _formKey.currentState?.fields['Age Months']?.setValue(null);
      _dateTime = DateTime.now();
      _selectedOption = null;
      _showSexError = false;
    });
  }
}
