import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:precarina/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:time_machine/time_machine.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'model/precarina_model.dart';

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
  // final _ageYearsKey = GlobalKey<FormFieldState<String>>();
  // final _ageMonthsKey = GlobalKey<FormFieldState<String>>();

  List<int> yearsRange = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
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

  var heightMaskFormatter = MaskTextInputFormatter(mask: '###,#', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

  var kilosWeightMaskFormatter = MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

  var gramsWeightMaskFormatter = MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

  var ageYearsMaskFormatter = MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

  var ageMonthsMaskFormatter = MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'^[0-9]{1,2}$')}, type: MaskAutoCompletionType.eager);

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
    final DateTime? pickedDate =
        await showDatePicker(context: context, initialDate: _currentDate, firstDate: DateTime(2000), lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != _currentDate) {
      setState(() {
        _dateTime = pickedDate;
        LocalDateTime a = LocalDateTime.now();
        LocalDateTime b = LocalDateTime.dateTime(pickedDate);
        Period diff = a.periodSince(b);

        // debugPrint("years: ${diff.years}; months: ${diff.months}; days: ${diff.days}; hours: ${diff.hours}; minutes: ${diff.minutes}; seconds: ${diff.seconds}");
        _textContAnios.text = diff.years.toString();
        _textContMeses.text = diff.months.toString();
        _formKey.currentState?.fields['Age Years']?.setValue(diff.years); //value(diff.years);
        _formKey.currentState?.fields['Age Months']?.setValue(diff.months);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var precaModel = Provider.of<PrecarinaModel>(context);

    return SingleChildScrollView(
      // resizeToAvoidBottomInset: true,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ingrese los datos del paciente",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Escoja el sexo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.0,
                  child: RadioListTile(
                    title: const Text('Mujer'),
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
                    title: const Text('Varón'),
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
            if (_showSexError)
              const Text(
                "Requerido",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            const SizedBox(
              height: 5.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ingrese la altura",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    key: _heightKey,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, heightMaskFormatter],
                    textAlign: TextAlign.center,
                    controller: _textContAltura,
                    focusNode: _heightFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Ej: 123,5',
                    ),
                    onTap: () {
                      _heightKey.currentState?.reset();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Requerido';
                      }
                      return null;
                    },
                  ),
                ),
                const Text(
                  "cm",
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ingrese el peso",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: TextFormField(
                    key: _weightKilosKey,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, kilosWeightMaskFormatter],
                    textAlign: TextAlign.center,
                    controller: _textContKilos,
                    decoration: const InputDecoration(
                      hintText: 'Ej: 42',
                    ),
                    onTap: () {
                      _weightKilosKey.currentState?.reset();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Requerido';
                      }
                      return null;
                    },
                  ),
                ),
                const Text(
                  "Kg",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  // TODO: Limit to 999
                  child: TextFormField(
                    key: _weightGramsKey,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, gramsWeightMaskFormatter],
                    textAlign: TextAlign.center,
                    controller: _textContGramos,
                    decoration: const InputDecoration(
                      hintText: 'Ej: 300',
                    ),
                    onTap: () {
                      _weightGramsKey.currentState?.reset();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Requerido';
                      }
                      return null;
                    },
                  ),
                ),
                const Text(
                  "g",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ingrese fecha de nacimiento \n o edad en años y meses",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Column(
            //       children: [
            //         ElevatedButton(
            //           onPressed: () => _selectDate(context),
            //           child: const Text(
            //             'Fecha de\n nacimiento',
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ],
            //     ),
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.center,
            //     //   children: [
            //     //     Container(
            //     //       width: 50.0,
            //     //       height: 30.0,
            //     //       decoration: BoxDecoration(
            //     //         borderRadius: BorderRadius.circular(20),
            //     //         color: Colors.grey[300],
            //     //       ),
            //     //       // TODO: Limit to 19
            //     //       child: TextFormField(
            //     //         key: _ageYearsKey,
            //     //         keyboardType: TextInputType.number,
            //     //         inputFormatters: [FilteringTextInputFormatter.digitsOnly, ageYearsMaskFormatter],
            //     //         textAlign: TextAlign.center,
            //     //         controller: _textContAnios,
            //     //         decoration: const InputDecoration(
            //     //           hintText: 'Ej: 1',
            //     //         ),
            //     //         onTap: () {
            //     //           _ageYearsKey.currentState?.reset();
            //     //         },
            //     //         validator: (value) {
            //     //           if (value == null || value.isEmpty) {
            //     //             return 'Requerido';
            //     //           }
            //     //           return null;
            //     //         },
            //     //       ),
            //     //     ),
            //     //     const Text(
            //     //       "a",
            //     //       style: TextStyle(
            //     //         fontSize: 15.0,
            //     //         fontWeight: FontWeight.bold,
            //     //       ),
            //     //     ),
            //     //     const SizedBox(
            //     //       width: 10.0,
            //     //     ),
            //     //     Container(
            //     //       width: 60.0,
            //     //       height: 30.0,
            //     //       decoration: BoxDecoration(
            //     //         borderRadius: BorderRadius.circular(20),
            //     //         color: Colors.grey[300],
            //     //       ),
            //     //       // Limit to 11 or set to 0 if Years is 19
            //     //       child: TextFormField(
            //     //         key: _ageMonthsKey,
            //     //         keyboardType: TextInputType.number,
            //     //         inputFormatters: [FilteringTextInputFormatter.digitsOnly, ageMonthsMaskFormatter],
            //     //         textAlign: TextAlign.center,
            //     //         controller: _textContMeses,
            //     //         decoration: const InputDecoration(
            //     //           hintText: 'Ej: 10',
            //     //         ),
            //     //         onTap: () {
            //     //           _ageMonthsKey.currentState?.reset();
            //     //         },
            //     //         validator: (value) {
            //     //           if (value == null || value.isEmpty) {
            //     //             return 'Requerido';
            //     //           }
            //     //           return null;
            //     //         },
            //     //       ),
            //     //     ),
            //     //     const Text(
            //     //       "m",
            //     //       style: TextStyle(
            //     //         fontSize: 15.0,
            //     //         fontWeight: FontWeight.bold,
            //     //       ),
            //     //     ),
            //     //   ],
            //     // ),
            //   ],
            // ),
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
                    child: const Text(
                      'Fecha de\n nacimiento',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: FormBuilderDropdown(
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(),
                        labelText: 'Años',
                      ),
                      name: "Age Years",
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      items: yearsRange
                          .map(
                            (age) => DropdownMenuItem(
                              value: age,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                age.toString() + (age == 0 || age == 1 ? " año" : " años"),
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
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(),
                        labelText: 'Meses',
                      ),
                      name: "Age Months",
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      items: monthsRange
                          .map(
                            (month) => DropdownMenuItem(
                              value: month,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                month.toString() + (month == 0 || month == 1 ? " mes" : " meses"),
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
                  child: const Text(
                    'Limpiar',
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
                      if (RegExp(r',\s*$').hasMatch(_textContAltura.text)) _textContAltura.text += '0';
                      // Let's change the comma to a period
                      _textContAltura.text.replaceAll(",", ".");
                      debugPrint("Altura: ${_textContAltura.text}");
                      precaModel.height = double.parse(_textContAltura.text.replaceAll(",", "."));
                      precaModel.weightKilos = int.parse(_textContKilos.text);
                      precaModel.weightGrams = int.parse(_textContGramos.text);
                      precaModel.ageYears = _formKey.currentState?.fields['Age Years']?.value;
                      precaModel.ageMonths = _formKey.currentState?.fields['Age Months']?.value;
                      // precaModel.ageYears = int.parse(_textContAnios.text);
                      // precaModel.ageMonths = int.parse(_textContMeses.text);

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
                  child: const Text(
                    'Continuar',
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
