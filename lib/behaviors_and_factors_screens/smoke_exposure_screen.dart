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
    final smokeExposureValues = [100, 80, 50, 30, 25, 5, 0];
    List<String> optionsTexts = AppLocalizations.of(context)!.txtSmokeExposureDialogOptions.split("|");

    bc = context;
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

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
                    ...(() {
                      List<Widget> sbList = [];
                      for (int i = 0; i < optionsTexts.length; i++) {
                        sbList.add(
                          SizedBox(
                            width: 300.0,
                            child: RadioListTile(
                              title: Text(optionsTexts[i]),
                              value: smokeExposureValues[i],
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
                        const HorizontalSpace(width: 10.0),
                        ElevatedButton(
                          onPressed: enableAcceptButton
                              ? () {
                                  precaModel.smokeValue = _selectedOption;
                                  debugPrint("Smoke Exposure Value en Screen: ${precaModel.smokeValue}");
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
          ],
        ),
      ),
    );
  }
}
