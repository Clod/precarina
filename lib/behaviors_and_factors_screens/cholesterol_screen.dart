import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import '../aux_functions/lose_input_warning.dart';
import '../help_pages/help_drawer.dart';

class CholesterolScreen extends StatefulWidget {
  const CholesterolScreen({super.key});

  @override
  State<CholesterolScreen> createState() => _CholesterolScreenState();
}

class _CholesterolScreenState extends State<CholesterolScreen> {
  late PrecarinaModel _precaModel;

  int? _selectedOption;

  bool _enableAcceptButton = false;

  @override
  void initState() {
    super.initState();
    _precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    // Score values
    final cholesterolValues = [100, 50, 0];
    List<String> optionsTexts =
        AppLocalizations.of(context)!.txtCholesterolDialogOptions.split("|");

    // List<String> optionsTexts =
    //     "< 170 mg/dl|170:199 mg/dl|≥ 200 mg/dl".split("|");

    debugPrint('...............${optionsTexts.length}................');
    debugPrint(optionsTexts.toString());

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.txtCholesterolButton),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildRadioGroup(
                      groupValue: _selectedOption,
                      onChanged: (newValue) {
                        // Only update state if the value actually changes
                        if (_selectedOption != newValue) {
                          setState(() {
                            _enableAcceptButton = true;
                            _selectedOption = newValue;
                          });
                        }
                      },
                      optionsTexts: optionsTexts,
                      optionsValues: cholesterolValues,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text(
                              AppLocalizations.of(context)!.txtButtonCancel),
                          onPressed: () => Navigator.maybePop(context),
                        ),
                        const HorizontalSpace(width: 10.0),
                        ElevatedButton(
                          onPressed: _enableAcceptButton
                              ? () {
                                  _precaModel.cholesterolValue =
                                      _selectedOption;
                                  debugPrint(
                                      "Cholesterol Value en Screen: ${_precaModel.cholesterolValue}");
                                  _precaModel.calculateAverage();
                                  Navigator.of(context).pop();
                                }
                              : null,
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

  /// Builds a radio group using `ToggleButtons` for single selection.
  ///
  /// The `groupValue` determines which option's value is currently selected.
  /// The `onChanged` callback is triggered when a new option is selected,
  /// providing the *value* of the newly selected option.
  /// The `optionsTexts` list provides the text labels for each button.
  /// The `optionsValues` list provides the corresponding integer values for each button.
  Widget _buildRadioGroup({
    required int? groupValue,
    required ValueChanged<int?> onChanged,
    required List<String> optionsTexts,
    required List<int> optionsValues,
  }) {
    assert(optionsTexts.length == optionsValues.length,
        'optionsTexts and optionsValues must have the same length');

    // Determine which button is selected based on its value matching groupValue
    List<bool> isSelected = List.generate(optionsValues.length, (index) {
      return optionsValues[index] == groupValue;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ToggleButtons(
        direction: Axis.vertical, // Arrange buttons vertically
        isSelected: isSelected,
        onPressed: (int index) {
          // Pass the value of the selected option to the onChanged callback
          onChanged(optionsValues[index]);
        },
        borderRadius: BorderRadius.circular(8.0),
        selectedBorderColor: Theme.of(context).colorScheme.primary,
        selectedColor: Theme.of(context).colorScheme.onPrimary,
        fillColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onSurface,
        borderColor: Colors.grey,
        borderWidth: 1.5,
        constraints: BoxConstraints(
          minHeight: 48.0, // Minimum height for each button
          minWidth: MediaQuery.of(context).size.width -
              32, // Fill available width (minus padding)
        ),
        children: optionsTexts
            .map((text) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
