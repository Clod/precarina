import 'package:flutter/material.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_pages/help_drawer.dart';
import '../l10n/app_localizations.dart';

class SmokeExposureScreen extends StatefulWidget {
  const SmokeExposureScreen({super.key});

  @override
  State<SmokeExposureScreen> createState() => _SmokeExposureScreenState();
}

class _SmokeExposureScreenState extends State<SmokeExposureScreen> {
  var precaModel = PrecarinaModel();

  int? _selectedOption;

  bool enableAcceptButton = false;

  @override
  void initState() {
    super.initState();
    precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.txtSmokeExposureButton),
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
                  children: [
                    _buildRadioGroup(
                      groupValue: _selectedOption,
                      onChanged: (int? value) {
                        if (value != null && value != _selectedOption) {
                          setState(() {
                            enableAcceptButton = true;
                            _selectedOption = value;
                          });
                        }
                      },
                      optionsTexts: AppLocalizations.of(context)!
                          .txtSmokeExposureDialogOptions
                          .split("|"),
                      optionsValues: const [100, 80, 50, 30, 25, 5, 0],
                    ),
                    const VerticalSpace(height: 15.0),
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
                          onPressed: enableAcceptButton
                              ? () {
                                  precaModel.smokeValue = _selectedOption;
                                  debugPrint(
                                      "Smoke Exposure Value en Screen: ${precaModel.smokeValue}");
                                  precaModel.calculateAverage();
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

  Widget _buildRadioGroup({
    required int? groupValue,
    required ValueChanged<int?> onChanged,
    required List<String> optionsTexts,
    required List<int> optionsValues,
  }) {
    assert(optionsTexts.length == optionsValues.length,
        'optionsTexts and optionsValues must have the same length');

    List<bool> isSelected = List.generate(optionsValues.length, (index) {
      return optionsValues[index] == groupValue;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ToggleButtons(
        direction: Axis.vertical,
        isSelected: isSelected,
        onPressed: (int index) {
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
          minHeight: 48.0,
          minWidth: MediaQuery.of(context).size.width - 32,
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
