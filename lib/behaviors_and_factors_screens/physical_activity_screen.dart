import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/localization.dart';
import 'package:precarina/aux_widgets/physical_activity_survey.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';

import 'package:precarina/aux_functions/lose_input_warning.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/help_pages/help_drawer.dart';

import '../aux_widgets/vertical_space.dart';

// Cartel rojo. El puntaje se mantiene pero aparece advertencia de que igual se lo considera sedentario
// Minutos totales porque todos los días de actividad pueden ser distintos
// validaciones
class PhysicalActivityScreen extends StatefulWidget {
  const PhysicalActivityScreen({super.key});

  @override
  State<PhysicalActivityScreen> createState() => _PhysicalActivityScreenState();
}

class _PhysicalActivityScreenState extends State<PhysicalActivityScreen> {
  var precaModel = PrecarinaModel();

  late BuildContext bc;

  int? _selectedOption;

  bool enableAcceptButton = true;

  final GlobalKey<PhysicalActivitySurveyState> innerWidgetKey = GlobalKey<PhysicalActivitySurveyState>();
  //final PhysicalActivitySurvey _physicalActivitySurvey =  PhysicalActivitySurvey(key: innerWidgetKey);

  @override
  void initState() {
    super.initState();
    precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {

    // List<String> optionsTexts = AppLocalizations.of(context)!.txtPhysicalActivityDialogOptions.split("|");

    bc = context;

    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtPhysicalActivityButton),
        ),
        drawer: const HelpDrawer(),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VerticalSpace(height: (15.0 + height /4)),
                    PhysicalActivitySurvey(key: innerWidgetKey),
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
                            if (innerWidgetKey.currentState!.formKey.currentState!.validate() == true) {
                              precaModel.physicalActivityValue = _selectedOption;
                              debugPrint("Physical Activity Value en Screen: ${precaModel.physicalActivityValue}");
                              precaModel.calculateAverage();
                              bool isRedBackground = innerWidgetKey.currentState!.triggerCalculation();
                              // Show a SnackBar with a button and make it stay until the button is pressed
                              // The background of the SnackBar can be red or black depending on the value of
                              // boolean
                              String snackBarText = 'Score: ${precaModel.physicalActivityValue}';
                              if (isRedBackground) {snackBarText += "physicalActivitySedentaryWarning".i18n();}
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(snackBarText),
                                  duration: const Duration(days: 1),
                                  backgroundColor: isRedBackground ? Colors.red : Colors.black,
                                  action: SnackBarAction(
                                    label: 'Ok',
                                    onPressed: () {
                                      // Hide virtual keyboard
                                      FocusScope.of(context).unfocus();
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              );
                            }
                          }
                              : null,
                          child: Text(AppLocalizations.of(context)!.txtButtonAccept),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 4,
                child: const PagesHeader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
