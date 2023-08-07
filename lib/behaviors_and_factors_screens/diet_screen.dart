import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/diet_item_widget.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_pages/help_drawer.dart';
import '../model/datos_alimentacion.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  PrecarinaModel? _precaModel;

  int? _indexSex = 0;
  int? _indexAgeRange = 0;

  final List<DietItem> _dietItemsList = [];

  // Accept button will not be anabled until an option is picked for EACH item.
  bool _enableAcceptButton = false;

  // _foodIndex keeps the choice (0, 1 or 2) for each item of the list of options
  // This dirty trick is used to be able to pass ints by reference to the callback
  // Items is the list of kinds of foods
  final List<List<int?>> _foodIndex = List.generate(Items.values.length, (_) => [null]);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _enableAcceptButton = false;
  }

  // Called each time the user makes a choice
  void foodCallback(List<int?> index, int? selection) {
    debugPrint("Index: $index, Selection: $selection");
    setState(() {
      index[0] = selection;
    });
    debugPrint("index: $index, selection: $selection");

    // If all Items are not null, it means that every option has an answer
    // so I can enable the Accept button.
    _enableAcceptButton = true;
    for (int i = 0; i < Items.values.length; i++) {
      if (_foodIndex[i][0] == null) {
        _enableAcceptButton = false;
      }
    }
  }

  // The list of presented options depends on both the sex and the age of the patient.
  // Each DietItem() consist of a title y three options presented below it.
  List<DietItem> _dietItems() {
    for (var i = 0; i < Items.values.length; i++) {
      _dietItemsList.add(
        DietItem(
          callback: foodCallback,   // called each time the user makes a choice
          index: _foodIndex[i],     // indicates
          title: titulo[i],
          opciones: opciones[_indexSex!][_indexAgeRange!][i],
        ),
      );
    }
    return _dietItemsList;
  }

  int? _calculateScore(List<List<int?>> selections) {
    int score = 0;

    // Recorro la lista. Si están todos los datos devuelvo el score y, si no, Ingresar datos
    //
    for (int i = 0; i < Items.values.length; i++) {
      if (selections[i][0] != null) {
        // Esta porquería es porque muestro el item que vale 2 a la izquierda
        // y el que vale 0 a la derecha.
        // TODO: corregirlo en la vesión bilingüe
        int valorASumar = selections[i][0]!;
        if (valorASumar == 0) {
          valorASumar = 2;
        } else if (valorASumar == 0) {
          valorASumar = 0;
        }
        score += valorASumar;
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
    // debugPrint("Data: ${_precaModel.toString()}");
    // debugPrint(_foodIndex.toString());

    _precaModel = Provider.of<PrecarinaModel>(context, listen: false);

    _dietItemsList.clear();

    // Select choices according to sex...
    if (_precaModel!.patientSex != null) {
      _precaModel!.patientSex == PatientSex.male ? _indexSex = 0 : _indexSex = 1;
    }

    // ...and age range
    if (_precaModel!.ageYears! <= 8) {
      _indexAgeRange = 0;
    } else if (_precaModel!.ageYears! < 14) {
      _indexAgeRange = 1;
    } else {
      _indexAgeRange = 2;
    }

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtDietButton),
        ),
        drawer: const HelpDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: PagesHeader(),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.yellow[50],
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      ..._dietItems(),
                      const VerticalSpace(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Cancel button
                          ElevatedButton(
                            child: Text(AppLocalizations.of(context)!.txtButtonCancel),
                            onPressed: () => Navigator.maybePop(context),
                          ),
                          const HorizontalSpace(width: 15.0),
                          // Accept button
                          ElevatedButton(
                            onPressed: !_enableAcceptButton
                                ? null
                                : () {
                                    _precaModel!.dietValue = _calculateScore(_foodIndex);
                                    debugPrint("Diet Value en Screen: ${_precaModel!.dietValue}");
                                    _precaModel!.calculateAverage();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Score: ${_precaModel!.dietValue}"),
                                        duration: const Duration(days: 1),
                                        action: SnackBarAction(
                                          label: 'OK',
                                          onPressed: () {
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                            Navigator.of(context).pop();
                                            // setState(() {
                                            //   diagnose = results[0];
                                            //   score = calculateScore(diagnose, _formKey.currentState!.fields['Medicado']?.value);
                                            // });
                                          },
                                        ),
                                      ),
                                    );
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
