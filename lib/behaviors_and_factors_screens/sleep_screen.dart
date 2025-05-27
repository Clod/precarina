import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
//import 'package:localization/localization.dart';
import 'package:precarina/aux_widgets/horizontal_space.dart';
import 'package:precarina/behaviors_and_factors_screens/pages_header.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import 'package:precarina/aux_functions/lose_input_warning.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:precarina/help_pages/help_drawer.dart';
import 'package:flutter_spinbox/cupertino.dart'; // or flutter_spinbox.dart for both

/*

Horas recomendadas de sueño según edad:

1-2 años: 11 -14 hs / dia incluyendo siestas regulares.
3-5 años: 10-13 hs/días incluyendo siestas regulares.
6-12 años: 9-12 hs/día
13-18 años: 8-10 hs/dia

Las horas de sueño se definirán como optima, limite, insuficiente, ajustada por la edad del paciente

	              3 a <6 años 	6 a < 13 años 	13-18 años
Apropiado 	    10-13 hs	        9-12 hs	     8-10 hs
Inapropiado 	    <10 hs          <9 hs        	<8 hs
                  >14 hs          >13 hs	      >10 hs



Puntaje
100: rango apropiado para la edad
90: < 1 hora por arriba del rango apropiado para la edad
70: < 1 hora por debajo del rango apropiado para la edad
40: 1 h< 2 hs por debajo del rango de la edad o > arriba del valor apropiado para la edad
20: 2< 3 hs debajo el rango apropiado para la edad
0: > 3 o mas horas por debajo del rango apropiado

 Tengo que preguntar la cantidad de horas dormidas por día:
 menos de 8 está mal
 más de 14 está mal

*/

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  var precaModel = PrecarinaModel();

  late BuildContext bc;

  // int? _selectedOption;

  bool enableAcceptButton = false;

  @override
  void initState() {
    super.initState();
    precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    bc = context;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.txtSleepButton),
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
                    const VerticalSpace(height: 20.0),
                    Text(
                      AppLocalizations.of(context)!.txtTotalSleepTime,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const VerticalSpace(height: 15.0),
                    Container(
                      width: 80.0,
                      color: Colors.yellow[200],
                      child: CupertinoSpinBox(
                        min: 1,
                        max: 23,
                        value: 0,
                        showCursor: false,
                        textStyle: const TextStyle(
                          fontSize: 35.0,
                          color: Colors.blueAccent,
                        ),
                        direction: Axis.vertical,
                        onChanged: (value) {
                          setState(() {
                            enableAcceptButton = true;
                            determineSleepScore(value.truncate());
                          });
                          debugPrint("$value");
                        },
                      ),
                    ),
                    const VerticalSpace(height: 20.0),
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
            ),
          ],
        ),
      ),
    );
  }

  void determineSleepScore(int hoursOfSleep) {
/*
Horas recomendadas de sueño según edad:

1-2 años: 11 -14 hs / dia incluyendo siestas regulares.
3-5 años: 10-13 hs/días incluyendo siestas regulares.
6-12 años: 9-12 hs/día
13-18 años: 8-10 hs/dia

Las horas de sueño se definirán como optima, limite, insuficiente, ajustada por la edad del paciente

	              3 a <6 años 	6 a < 13 años 	13-18 años
Apropiado 	    10-13 hs	        9-12 hs	     8-10 hs
Inapropiado 	    <10 hs          <9 hs        	<8 hs
                  >14 hs          >13 hs	      >10 hs

Puntaje
100: rango apropiado para la edad
90: < 1 hora por arriba del rango apropiado para la edad
70: < 1 hora por debajo del rango apropiado para la edad
40: 1 h< 2 hs por debajo del rango de la edad o > arriba del valor apropiado para la edad
20: 2< 3 hs debajo el rango apropiado para la edad
0: > 3 o mas horas por debajo del rango apropiado

0 Menos de 8 h/d
1 8 a menos de 9 h/d
2 9 a menos de 10 h/d
3 10 a menos de 11 h/d
4 11 a menos de 12 h/d
5 12 a menos de 13 h/d
6 13 a 14 h/d
7 Más de 14

*/

    int min, max = 0;
    int score = 0;

    double age = (precaModel.ageYears! + precaModel.ageMonths! / 12.0);

    // Optimal ranges
    if (age >= 1 && age < 3) {
      min = 11;
      max = 14;
    } else if (age >= 3 && age < 6) {
      min = 10;
      max = 13;
    } else if (age >= 6 && age < 13) {
      min = 9;
      max = 12;
    } else {
      min = 8;
      max = 10;
    }

    if (hoursOfSleep >= min && hoursOfSleep <= max) {
      score = 100;
    } else if (hoursOfSleep > max && hoursOfSleep < max + 1) {
      score = 90;
    } else if (hoursOfSleep < min && hoursOfSleep > min - 1) {
      score = 70;
    } else if ((hoursOfSleep > min - 2 && hoursOfSleep >= min - 1) || (hoursOfSleep < max + 2 && hoursOfSleep >= max + 1)) {
      score = 40;
    } else if (hoursOfSleep <= min - 2 && hoursOfSleep > min - 3) {
      score = 20;
    } else {
      score = 0;
    }

    precaModel.sleepValue = score;

    debugPrint("Score determinado: $score");
  }
}
