import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/behaviors_and_factors_screens/pa.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';

import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/horizontal_space.dart';
import '../help_pages/help_drawer.dart';

class PhysicalActivityScreen extends StatefulWidget {
  const PhysicalActivityScreen({super.key});

  @override
  State<PhysicalActivityScreen> createState() => _PhysicalActivityScreenState();
}

class _PhysicalActivityScreenState extends State<PhysicalActivityScreen> {
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
    final physicalActivityValues = [100, 90, 80, 60, 40, 20, 0];
    List<String> optionsTexts = AppLocalizations.of(context)!.txtPhysicalActivityDialogOptions.split("|");

    bc = context;

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtPhysicalActivityButton),
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
                      PhysicalActivitySurvey(),
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
                                    precaModel.physicalActivityValue = _selectedOption;
                                    debugPrint("Physical Activity Value en Screen: ${precaModel.physicalActivityValue}");
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
      ),
    );
  }
}
