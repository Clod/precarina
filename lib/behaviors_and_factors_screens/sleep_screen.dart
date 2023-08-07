import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_pages/help_drawer.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  var precaModel = PrecarinaModel();

  late BuildContext bc;

  int? _selectedOption;

  bool enableAcceptButton = false;

  @override
  void initState() {
    super.initState();
    precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final sleepValues = [100, 90, 70, 40, 20, 0];
    List<String> optionsTexts = AppLocalizations.of(context)!.txtSleepDialogOptions.split("|");

    bc = context;

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtSleepButton),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...(() {
                      List<Widget> sbList = [];
                      for (int i = 0; i < optionsTexts.length; i++) {
                        sbList.add(SizedBox(
                          width: 300.0,
                          child: RadioListTile(
                            title: Text(optionsTexts[i]),
                            value: sleepValues[i],
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                enableAcceptButton = true;
                                _selectedOption = value;
                              });
                            },
                          ),
                        ));
                        sbList.add(const VerticalSpace(height: 5.0));
                      }
                      return sbList;
                    })(),
                    const VerticalSpace(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text(AppLocalizations.of(context)!.txtButtonCancel),
                          onPressed: () => Navigator.maybePop(context),
                        ),
                        const HorizontalSpace(width: 15.0),
                        ElevatedButton(
                          onPressed: enableAcceptButton
                              ? () {
                            precaModel.sleepValue = _selectedOption;
                            debugPrint("Sueño Value en Screen: ${precaModel.sleepValue}");
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
            ],
          ),
        ),
      ),
    );
  }
}
