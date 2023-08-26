import 'package:flutter/material.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

class PhysicalActivitySurvey extends StatefulWidget {
  const PhysicalActivitySurvey({super.key});

  @override
  PhysicalActivitySurveyState createState() => PhysicalActivitySurveyState();
}

class PhysicalActivitySurveyState extends State<PhysicalActivitySurvey> {
  var precaModel = PrecarinaModel();

  int p1Value = 0;
  int p2Value = 0;
  int p3Value = 2;
  int p4Value = 0;
  int p5Value = 1;
  int p6Value = 0;
  TextEditingController p6Controller = TextEditingController();
  TextEditingController p4Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();

  bool disableQ2 = true;
  bool disableQ4 = true;

  @override
  void initState() {
    super.initState();
    precaModel = Provider.of<PrecarinaModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'P1. ¿Cuántos días por semana práctica deportes, juegos, ejercicios físicos, danza u otra actividad física?',
            style: TextStyle(fontSize: 18),
          ),
          const Text(
            '(Considerar sólo actividades practicadas fuera del ámbito escolar)',
            style: TextStyle(fontSize: 12),
          ),
          const VerticalSpace(height: 8),
          RadioListTile(
            title: const Text('Ninguno (pasar a P3)'),
            value: 0,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('1 día por semana'),
            value: 1,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('2 días por semana'),
            value: 2,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('3 días por semana'),
            value: 3,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('4 días por semana'),
            value: 4,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('5 días por semana'),
            value: 5,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('6 días por semana'),
            value: 6,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: const Text('7 días por semana'),
            value: 7,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          const VerticalSpace(height: 16),
          Text(
            'P2. ¿Cuánto tiempo en total dedica habitualmente en esos días a realizar deportes, juegos, ejercicios físicos, danza u otra actividad física?',
            style: TextStyle(
              fontSize: 18,
              color: (disableQ2 ? Colors.black38 : Colors.black87),
            ),
          ),
          const VerticalSpace(height: 8),
          AbsorbPointer(
            absorbing: disableQ2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45.0,
                  color: Colors.yellow[100],
                  child: TextField(
                    controller: p2Controller,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        p2Value = int.tryParse(value)!;
                      });
                    },
                    decoration: const InputDecoration(
                      counterText: '', // Hide the counter text
                    ),
                  ),
                ),
                Text(
                  " mins.",
                  style: TextStyle(
                    fontSize: 18,
                    color: (disableQ2 ? Colors.black38 : Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpace(height: 16),
          const Text(
            'P3. ¿Habitualmente como suele transportarse a la escuela?',
            style: TextStyle(fontSize: 18),
          ),
          const VerticalSpace(height: 8),
          RadioListTile(
            title: const Text('Caminando'),
            value: 0,
            groupValue: p3Value,
            onChanged: onPickTransport,
          ),
          RadioListTile(
            title: const Text('Bicicleta'),
            value: 1,
            groupValue: p3Value,
            onChanged: onPickTransport,
          ),
          RadioListTile(
            title: const Text('Transporte motorizado (auto, moto, colectivo, subte, pre-metro, tren)'),
            value: 2,
            groupValue: p3Value,
            onChanged: onPickTransport,
          ),
          const VerticalSpace(height: 16),
          Text(
            'P4. ¿A cuántas cuadras de su casa queda la escuela o el colegio al que asiste?',
            style: TextStyle(
              fontSize: 18.0,
              color: (disableQ4 ? Colors.black38 : Colors.black87),
            ),
          ),
          const VerticalSpace(height: 8),
          AbsorbPointer(
            absorbing: disableQ4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45.0,
                  color: Colors.yellow[100],
                  child: TextField(
                    controller: p4Controller,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        p4Value = int.tryParse(value)!;
                      });
                    },
                    decoration: const InputDecoration(
                      counterText: '', // Hide the counter text
                    ),
                  ),
                ),
                Text(
                  " cuadras",
                  style: TextStyle(
                    fontSize: 18,
                    color: (disableQ4 ? Colors.black38 : Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpace(height: 16),
          const Text(
            'P5. ¿Cuántas veces por semana tiene clases de Educación Física en la escuela?',
            style: TextStyle(fontSize: 18),
          ),
          const VerticalSpace(height: 8),
          RadioListTile(
            title: const Text('1 vez por semana'),
            value: 1,
            groupValue: p5Value,
            onChanged: daysOfPaClasses,
          ),
          RadioListTile(
            title: const Text('2 veces por semana'),
            value: 2,
            groupValue: p5Value,
            onChanged: daysOfPaClasses,
          ),
          RadioListTile(
            title: const Text('3 veces por semana'),
            value: 3,
            groupValue: p5Value,
            onChanged: daysOfPaClasses,
          ),
          RadioListTile(
            title: const Text('4 veces por semana'),
            value: 4,
            groupValue: p5Value,
            onChanged: daysOfPaClasses,
          ),
          RadioListTile(
            title: const Text('5 veces por semana'),
            value: 5,
            groupValue: p5Value,
            onChanged: daysOfPaClasses,
          ),
          RadioListTile(
            title: const Text('6 veces por semana'),
            value: 6,
            groupValue: p5Value,
            onChanged: daysOfPaClasses,
          ),
          const VerticalSpace(height: 16),
          const Text(
            'P6. ¿Cuántos minutos por día pasa frente a una pantalla de computadora, tablet, celular o televisor?',
            style: TextStyle(fontSize: 18),
          ),
          const VerticalSpace(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45.0,
                color: Colors.yellow[100],
                child: TextField(
                  controller: p6Controller,
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      p6Value = int.tryParse(value)!;
                    });
                  },
                  decoration: const InputDecoration(
                    counterText: '', // Hide the counter text
                  ),
                ),
              ),
              const Text("  minutos"),
            ],
          ),
        ],
      ),
    );
  }

  void daysOfPaClasses(value) {
    setState(() {
      p5Value = value;
    });
  }

  void onPickTransport(value) {
    setState(() {
      p3Value = value;
      if (p3Value == 2) {
        disableQ4 = true;
        p4Controller.clear();
      } else {
        disableQ4 = false;
      }
    });
  }

  void physicalActiveDaysChoice(value) {
    FocusScope.of(context).unfocus();
    setState(() {
      p1Value = value;
      if (p1Value == 0) {
        disableQ2 = true;
        p2Controller.clear();
      } else {
        disableQ2 = false;
      }
    });
  }

  /*

      TAFD (minutos/día) = TAD + TEF + TATE

correspondiendo:

TAD (minutos/día): tiempo de actividad deportiva diario promedio
TEF (minutos/día): tiempo de educación física diario promedio
TATE (minutos/día): tiempo de actividad física en el transporte escolar diario promedio

TAD, es definido a partir de las siguientes variables:
    P1 = días de práctica de deportes, juegos, ejercicios físicos, danza u otra actividad física
    P2a = tiempo en horas
    P2b = tiempo en minutos
    P2 = tiempo de sesión (minutos) = (P2a x 60) + P2b

TAD (minutos/día) = (P1 x P2) / 7
TEF, es definido a partir de las siguientes variables:
P5 = frecuencia semanal de clases de educación física
Duración de la clase según nivel educativo
(DNE) = primario (45 minutos) o secundario (60 minutos)

TEF (minutos/día) = (P5 x DNE) / 7

P4: P4 = distancia en km desde el domicilio a la escuela
  TATE (minutos/día) = (10 x((P4/4,32) x 60)) / 7
Para bicicleta (menores de 14 años):
TATE (minutos/día) = (10 x((P4/13) x 60)) / 7
Para bicicleta (14 y más años):
TATE (minutos/día) = (10 x((P4/14,5) x 60)) / 7
*/

  bool triggerCalculation() {

    debugPrint("Empezando con los cálculos");
    // Clases de Educación Física
    int weeklyClases = p5Value;
    debugPrint("Weekly classes: $weeklyClases");

    // Actividad física
    int weeklyActivities = p1Value + 1;

    // Tiempo de actividad física en minutos diarios
    int tad = (weeklyActivities * p2Value / 7).truncate();

    debugPrint("TAD: $tad");

    // Tiempo de transporte escolar en minutos diarios
    int tate = 0;

    switch (p3Value) {
      case 0:
        tate = (10 * ((p4Value / 43.2) * 60) / 7).truncate();
        break;
      case 1:
        double factor = precaModel.ageYears! > 14 ? 14.5 : 13.0;
        tate = (10 * ((p4Value / factor) * 60) / 7).truncate();
        break;
      default:
        break;
    }

    debugPrint("TATE: $tate");

    // Tiempo clases educación física en minutos diarios
    // Duración de la clase según nivel educativo = primario (45 minutos) o secundario (60 minutos)
    int tef = (weeklyClases * (precaModel.ageYears! > 13 ? 60 : 45) / 7).truncate();
    debugPrint("TEF: $tef");

    // Promedio diario total en minutos
    int totalMinutes = tad + tate + tef;

    // Consideramos el ideal 45 minutos diarios (score 100)

    precaModel.physicalActivityValue = (100 * totalMinutes / 45.0).truncate();

    if (precaModel.physicalActivityValue! > 100) precaModel.physicalActivityValue = 100;

    // Si pasa más de 120 minutos en la compu el snackbar es rojo
    return p6Value >= 120 ? true : false;
  }
}
