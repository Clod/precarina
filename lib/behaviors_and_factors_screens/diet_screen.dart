import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/diet_item_widget.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_pages/help_drawer.dart';
import '../model/datos_alimentacion.dart';

// Key for DietScreen Scaffold, used in integration tests
const Key dietScreenScaffoldKey = Key('dietScreenScaffold');

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  PrecarinaModel? _precaModel;

  int? _indexSex = 0;
  int? _indexAgeRange = 0;

  // Accept button will not be anabled until an option is picked for EACH item.
  bool _enableAcceptButton = false;

  // _foodIndex keeps the choice (0, 1 or 2) for each item of the list of options
  // This dirty trick is used to be able to pass ints by reference to the callback
  // Items is the list of kinds of foods
  final List<List<int?>> _foodIndex =
      List.generate(Items.values.length, (_) => [null]);

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

    // Enable the Accept button only if all items have a selection.
    setState(() {
      _enableAcceptButton = _foodIndex.every((item) => item[0] != null);
    });
  }

  int _getActualScoreValue(int selectedOptionValue) {
    // Esta porquería es porque muestro el item que vale 2 a la izquierda
    // y el que vale 0 a la derecha.
    if (selectedOptionValue == 0) return 2;
    if (selectedOptionValue == 2) return 0;
    return selectedOptionValue; // Assuming 1 maps to 1 (or other direct mapping)
  }

  int? _calculateScore(List<List<int?>> selections) {
    int score = 0;

    // Recorro la lista. Si están todos los datos devuelvo el score y, si no, Ingresar datos
    for (int i = 0; i < Items.values.length; i++) {
      if (selections[i][0] != null) {
        score += _getActualScoreValue(selections[i][0]!);
      } else {
        // This case should ideally not be reached if _enableAcceptButton logic is correct,
        // as _calculateScore is called when the button is enabled.
        return null;
      }
    }
    score = (score * 3.3333333).round();

    // _enableAcceptButton should already be true if this method is called.
    // No need to set it again here.

    debugPrint("Valor de dieta calculado: $score");

    return score;
  }

  @override
  Widget build(BuildContext context) {
    List<String> localizedTitulos = getTitulos(context);
    List<List<List<List<String>>>> localizedOpciones = getOpciones(context);

    _precaModel = Provider.of<PrecarinaModel>(context, listen: false);

    // Select choices according to sex...
    if (_precaModel!.patientSex != null) {
      _precaModel!.patientSex == PatientSex.male
          ? _indexSex = 0
          : _indexSex = 1;
    }

    // ...and age range
    if (_precaModel!.ageYears! <= 8) {
      _indexAgeRange = 0;
    } else if (_precaModel!.ageYears! < 14) {
      _indexAgeRange = 1;
    } else {
      _indexAgeRange = 2;
    }

    return Scaffold(
      key: dietScreenScaffoldKey, // Added key for testing
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.txtDietButton),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => showInputLostWarning(context),
        ),
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
                  key: const Key('diet_screen_list_view'), // Add a key for better testability
                  controller: _scrollController,
                  children: [
                    // Generate DietItem widgets directly
                    ...List.generate(Items.values.length, (i) {
                      return DietItem(
                        callback: foodCallback, // called each time the user makes a choice
                        index: _foodIndex[i],    // indicates the selection for this item
                        title: localizedTitulos[i],
                        opciones: localizedOpciones[_indexSex!][_indexAgeRange!][i],
                      );
                    }),
                    // ..._dietItemsList, // Old way

                    const VerticalSpace(height: 15.0),
                    Row(
                  key: const Key('diet_screen_button_row'), // ADD THIS KEY
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cancel button
                        ElevatedButton(
                          child: Text(
                              AppLocalizations.of(context)!.txtButtonCancel),
                          onPressed: () => Navigator.maybePop(context),
                        ),
                        const HorizontalSpace(width: 15.0),
                        // Accept button
                        ElevatedButton(
                          key: const Key('diet_accept_button'),
                          onPressed: !_enableAcceptButton
                              ? null
                              : () {
                                  _precaModel!.dietValue =
                                      _calculateScore(_foodIndex);
                                  debugPrint(
                                      "Diet Value en Screen: ${_precaModel!.dietValue}");
                                  _precaModel!.calculateAverage();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Score: ${_precaModel!.dietValue}"),
                                      duration: const Duration(days: 1),
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
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
                          child: Text(
                              AppLocalizations.of(context)!.txtButtonAccept),
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
    );
  }
}
