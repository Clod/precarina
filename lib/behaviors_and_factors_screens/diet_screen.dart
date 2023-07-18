import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

import '../aux_widgets/diet_item_widget.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_drawer.dart';
import '../model/datos.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late PrecarinaModel precaModel;

  int? _indexSex = 0;
  int? _indexAgeRange = 0;

  int? indiceVegetalesVerdes;

  List<DietItem> dietItemsList = [];

  // Accept button will not be anabled until an option is picked for EACH item.
  late bool _enableAcceptButton;

  // This dirty trick is used to be able to pass ints by reference to the callback
  List<List<int?>> foodIndex = List.generate(Items.values.length, (_) => [null]);

  final ScrollController _scrollController = ScrollController();

  List<int?> indice = List.filled(15, null);

  @override
  void initState() {
    super.initState();
    _enableAcceptButton = false;
  }
  // final GlobalKey<_DietQuestionnaireWidgetState> _navBarKey = GlobalKey<_DietQuestionnaireWidgetState>();

  void foodCallback(List<int?> index, int? selection) {
    debugPrint("index: $index, selection: $selection");
    setState(() {
      index[0] = selection;
    });
    debugPrint("index: $index, selection: $selection");
  }

  // List of options
  List<DietItem> dietItems() {
    for (var i = 0; i < Items.values.length; i++) {
      dietItemsList.add(DietItem(callback: foodCallback, index: foodIndex[i], title: titulo[i], opciones: opciones[_indexSex!][_indexAgeRange!][i]));
    }
    return dietItemsList;
  }

  int? calcularScore(List<List<int?>> selections) {
    int score = 0;

    // Recorro la lista. Si están todos los datos devuelvo el score y, si no, Ingresar datos
    for (int i = 0; i < Items.values.length; i++) {
      if (selections[i][0] != null) {

        // Esta porquería es porque muestro el item que vale 2 a la izquierda
        // y el que vale 0 a la derecha.
        // TODO: corregirlo en la vesión bilingüe
        int valorASumar = selections[i][0]!;
        if (valorASumar == 0 ) {
          valorASumar = 2;
        } else if (valorASumar == 0) {
          valorASumar = 0;
        }
        score += valorASumar;

        // score += selections[i][0]!;
      } else {
        return null;
      }
    }
    score = (score * 3.3333333).round();

    debugPrint("Habilito el botón de aceptar");
    _enableAcceptButton = true;

    debugPrint("Valor de dieta calculado: $score");

    return score;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("En build");
    debugPrint(foodIndex.toString());
    dietItemsList.clear();

    // TODO: en init no puedo llamarlo porque explota pero acá no me gusta.
    precaModel = precaModel = Provider.of<PrecarinaModel>(context);

    precaModel.patientSex == PatientSex.male ? _indexSex = 0 : _indexSex = 1;

    if (precaModel.ageYears! <= 8) {
      _indexAgeRange = 0;
    } else if (precaModel.ageYears! < 14) {
      _indexAgeRange = 1;
    } else {
      _indexAgeRange = 2;
    }

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.txtCancelModalTitle),
              content: Text(AppLocalizations.of(context)!.txtCancelModalText),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(AppLocalizations.of(context)!.txtCancelModalDiscard),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(AppLocalizations.of(context)!.txtCancelModalVolver),
                ),
              ],
            );
          },
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtDietButton),
        ),
        drawer: const HelpDrawer(),
        body: SafeArea(
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
                        "Sexo",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const VerticalSpace(altura: 10.0),
                      CupertinoSegmentedControl<int>(
                        children: const {
                          0: Padding(padding: EdgeInsets.all(8.0), child: Text('Varón')),
                          1: Padding(padding: EdgeInsets.all(8.0), child: Text('Mujer')),
                        },
                        onValueChanged: (int? value) {
                          setState(() {
                            _indexSex = value!;
                          });
                        },
                        groupValue: _indexSex,
                      ),
                      const VerticalSpace(altura: 15.0),
                      const Text(
                        "Rango etario",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const VerticalSpace(altura: 10.0),
                      CupertinoSegmentedControl<int>(
                        children: const {
                          0: Padding(padding: EdgeInsets.all(8.0), child: Text('5 a 8 años')),
                          1: Padding(padding: EdgeInsets.all(8.0), child: Text('9 a 13 años')),
                          2: Padding(padding: EdgeInsets.all(8.0), child: Text('14 a 18 años')),
                        },
                        onValueChanged: (int? value) {
                          setState(() {
                            _indexAgeRange = value!;
                          });
                        },
                        groupValue: _indexAgeRange,
                      ),
                      const VerticalSpace(altura: 15.0),
                      Row(
                        children: [
                          // SizedBox(width: 60.0),
                          Expanded(
                            child: Center(
                              child: calcularScore(foodIndex) != null ?  Text(
                                "Score: ${calcularScore(foodIndex)}",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ) : const Text(
                                "Score: Ingrese todos los datos",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            child: const Icon(Icons.delete),
                            onPressed: () {
                              _enableAcceptButton = false;
                              setState(() {
                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                                // foodIndex.forEach((element) => element[0] = null);
                                for (var element in foodIndex) {
                                  element[0] = null;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      const VerticalSpace(altura: 10.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow[50],
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      ...dietItems(),
                      const VerticalSpace(altura: 15.0),
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
                              onPressed: !_enableAcceptButton
                                  ? null
                                  : () {
                                      precaModel.dietValue = calcularScore(foodIndex);
                                      debugPrint("Diet Value en Screen: ${precaModel.dietValue}");
                                      precaModel.calculateAverage();
                                      Navigator.of(context).pop();
                                    },
                              child: Text(AppLocalizations.of(context)!.txtButtonAccept)),
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
