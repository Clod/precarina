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
    // Score values
    final cholesterolValues = [100, 50, 0];
    List<String> optionsTexts = AppLocalizations.of(context)!.txtCholesterolDialogOptions.split("|");

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
                    ...(() {
                      List<SizedBox> sbList = [];
                      for (int i = 0; i < optionsTexts.length; i++) {
                        sbList.add(
                          SizedBox(
                            width: 300.0,
                            child: RadioListTile(
                              title: Text(optionsTexts[i]),
                              value: cholesterolValues[i],
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  enableAcceptButton = true;
                                  _selectedOption = value;
                                });
                              },
                            ),
                          ),
                        );
                      }
                      return sbList;
                    })(),
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
                                  precaModel.cholesterolValue = _selectedOption;
                                  debugPrint(
                                      "Cholesterol Value en Screen: ${precaModel.cholesterolValue}");
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
}
