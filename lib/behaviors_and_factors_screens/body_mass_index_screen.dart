import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_drawer.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../input_data_page.dart';

late final Interpreter _interpreter;

bool _interpreterUpAndRunning = false;

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
    _interpreterUpAndRunning = true;
  } catch (e) {
    debugPrint('Interpreter NOT loaded successfully');
    debugPrint("Error: $e");
  }
}

class _BodyMassIndexScreenState extends State<BodyMassIndexScreen> {
  var precaModel = PrecarinaModel();

  late BuildContext bc;

  int? _selectedBmiOption;

  bool enableAcceptButton = false;

  late DateTime dateTime;
  late DateTime currentDate;
  String? _selectedOption;
  final TextEditingController _textContAltura = TextEditingController();
  final TextEditingController _textContKilos = TextEditingController();
  final TextEditingController _textContGramos = TextEditingController();
  final TextEditingController _textContAnios = TextEditingController();
  final TextEditingController _textContMeses = TextEditingController();
  String _imc = "";
  String _percentil = "";

  calcularEdad(DateTime nacimiento) {
    // Duration parse = nacimiento.difference(DateTime.now()).abs();
    return "";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate =
        await showDatePicker(context: context, initialDate: currentDate, firstDate: DateTime(2000), lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        dateTime = pickedDate;
        Duration parse = pickedDate.difference(DateTime.now()).abs();
        debugPrint("${parse.inDays ~/ 360} Years ${((parse.inDays % 360) ~/ 30)} Month ${(parse.inDays % 360) % 30} Days");
        _textContAnios.text = (parse.inDays ~/ 360).toString();
        _textContMeses.text = ((parse.inDays % 360) ~/ 30).toString();
      });
    }
  }

  _obtenerResultados(BuildContext context) {
    // Hide the keyboard
    FocusScope.of(context).unfocus();
    // var input = [[7.011268, 12.637012, 0.0, 1.0]];
    List<List<double>> input = [
      [0.0, 0.0, 0.0, 0.0]
    ];
    var output = [
      [0.00]
    ];

    double imc = (double.parse(_textContKilos.text) + double.parse(_textContGramos.text) / 1000.0) /
        ((double.parse(_textContAltura.text) / 100.0) * (double.parse(_textContAltura.text) / 100.0));

    double edad = double.parse(_textContAnios.text) + double.parse(_textContMeses.text) / 12.0;

    input[0][1] = imc;
    input[0][0] = edad;

    if (_selectedOption == "mujer") {
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

      if (output[0][0].truncate() >= 100.0) {
        _percentil = '100 %';
      } else if (output[0][0].truncate() <= 0.0) {
        _percentil = '0 %';
      } else {
        _percentil = '${output[0][0].truncate()} %';
      }
    });
  }

  _resetearValores(BuildContext context) {
    setState(() {
      _textContAltura.text = '';
      _textContKilos.text = '';
      _textContGramos.text = '';
      _textContAnios.text = '';
      _textContMeses.text = '';
      _imc = "";
      _percentil = "";
      dateTime = DateTime.now();
      _selectedOption = null;
    });
  }

  @override
  void initState() {
    super.initState();

    try {
      _loadModel();
    } catch (e) {
      debugPrint("Error al cargar el Modelo: ${e.toString()}");
    }

    dateTime = DateTime.now();
    currentDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Acá no me gusta pero initState explota. Ver si hay un lugar mejor
    precaModel = Provider.of<PrecarinaModel>(context);

    debugPrint("Building Wdiget");

    // final bmiValues = [100, 70, 30, 15, 0];
    // List<String> optionsTexts = AppLocalizations.of(context)!.txtBodyMassIndexDialogOptions.split("|");

    bc = context;
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtBodyMassIndexButton),
        ),
        drawer: const HelpDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.yellow[200],
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        const VerticalSpace(altura: 15.0),
                        const Text(
                          "Sexo: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Edad: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Estatura: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Peso: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            CupertinoButton(
                              child: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        const VerticalSpace(altura: 10.0),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const VerticalSpace(altura: 10.0),
                      const Text(
                        "Ingrese el sexo",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            width: 150.0,
                            child: RadioListTile(
                              title: const Text('Mujer'),
                              value: 'mujer',
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150.0,
                            child: RadioListTile(
                              title: const Text('Varón'),
                              value: 'varon',
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Ingrese la altura",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const VerticalSpace(altura: 10.0),
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
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              textAlign: TextAlign.center,
                              controller: _textContAltura,
                              decoration: const InputDecoration(
                                hintText: 'Ej: 160',
                              ),
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
                      const Text(
                        "Ingrese el peso",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              textAlign: TextAlign.center,
                              controller: _textContKilos,
                              decoration: const InputDecoration(
                                hintText: 'Ej: 50',
                              ),
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
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              textAlign: TextAlign.center,
                              controller: _textContGramos,
                              decoration: const InputDecoration(
                                hintText: 'Ej: 500',
                              ),
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
                        height: 20.0,
                      ),
                      const Text(
                        "Ingrese fecha de nacimiento \n o edad en años y meses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () => _selectDate(context),
                                child: const Text(
                                  'Fecha de\n nacimiento',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Text(
                              //   dateFormat.format(dateTime),
                              // ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300],
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  textAlign: TextAlign.center,
                                  controller: _textContAnios,
                                  decoration: const InputDecoration(
                                    hintText: 'Ej: 14',
                                  ),
                                ),
                              ),
                              const Text(
                                "a",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300],
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  textAlign: TextAlign.center,
                                  controller: _textContMeses,
                                  decoration: const InputDecoration(
                                    hintText: 'Ej: 6',
                                  ),
                                ),
                              ),
                              const Text(
                                "m",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => _resetearValores(context),
                            child: const Text(
                              'Limpiar',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          ElevatedButton(
                            onPressed: () => _interpreterUpAndRunning ? _obtenerResultados(context) : showSnackbar(context),
                            child: const Text(
                              'Calcular',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "IMC: ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _imc,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Text(
                            "Percentil: ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _percentil,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     ...(() {
                  //       List<Widget> sbList = [];
                  //       for (int i = 0; i < optionsTexts.length; i++) {
                  //         sbList.add(SizedBox(
                  //           width: 300.0,
                  //           child: RadioListTile(
                  //             title: Text(optionsTexts[i]),
                  //             value: bmiValues[i],
                  //             groupValue: _selectedBmiOption,
                  //             onChanged: (value) {
                  //               setState(() {
                  //                 enableAcceptButton = true;
                  //                 _selectedBmiOption = value;
                  //               });
                  //             },
                  //           ),
                  //         ));
                  //         sbList.add(const VerticalSpace(altura: 5.0));
                  //       }
                  //       return sbList;
                  //     })(),
                  //     const VerticalSpace(altura: 15.0),
                  //   ],
                  // ),
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
                      onPressed: enableAcceptButton
                          ? () {
                              precaModel.bmiValue = _selectedBmiOption;
                              debugPrint("BMI Value en Screen: ${precaModel.bmiValue}");
                              precaModel.calculateAverage();
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: Text(AppLocalizations.of(context)!.txtButtonAccept),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("No se cargó el traductor \n Por fafor \n Avise al desarrollador"),
        duration: const Duration(days: 1),
        action: SnackBarAction(
          label: 'Listo',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
