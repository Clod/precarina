import 'package:flutter/material.dart';

class PhysicalActivitySurvey extends StatefulWidget {
  @override
  _PhysicalActivitySurveyState createState() => _PhysicalActivitySurveyState();
}

class _PhysicalActivitySurveyState extends State<PhysicalActivitySurvey> {
  int? p1Value;
  int? p2Value;
  int? p3Value;
  int? p4Value;
  int? p5Value;
  TextEditingController p4Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();

  bool disableQ2 = true;

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
          Text(
            '(Considerar sólo actividades practicadas fuera del ámbito escolar)',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text('Ninguno (pasar a P3)'),
            value: 0,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: Text('1 día por semana'),
            value: 1,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: Text('2 días por semana'),
            value: 2,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: Text('3 días por semana'),
            value: 3,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: Text('4 días por semana'),
            value: 4,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: Text('5 días por semana'),
            value: 5,
            groupValue: p1Value,
            onChanged: physicalActiveDaysChoice,
          ),
          RadioListTile(
            title: Text('6 días por semana'),
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
          const SizedBox(height: 16),
          Text(
            'P2. ¿Cuánto tiempo en total dedica habitualmente en esos días a realizar deportes, juegos, ejercicios físicos, danza u otra actividad física?',
            style: TextStyle(
              fontSize: 18,
              color: (disableQ2 ? Colors.black38 : Colors.black87),
            ),
          ),
          const SizedBox(height: 8),
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
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        p2Value = int.tryParse(value);
                      });
                    },
                  ),
                ),
                const Text(" mins."),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'P3. ¿Habitualmente como suele transportarse a la escuela?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          RadioListTile(
            title: Text('Caminando'),
            value: 0,
            groupValue: p3Value,
            onChanged: (value) {
              setState(() {
                p3Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Bicicleta'),
            value: 1,
            groupValue: p3Value,
            onChanged: (value) {
              setState(() {
                p3Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Transporte motorizado (auto, moto, colectivo, subte, pre-metro, tren)'),
            value: 2,
            groupValue: p3Value,
            onChanged: (value) {
              setState(() {
                p3Value = value;
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'P4. ¿A cuántas cuadras de su casa queda la escuela o el colegio al que asiste?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45.0,
                color: Colors.yellow[100],
                child: TextField(
                  controller: p4Controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      p4Value = int.tryParse(value);
                    });
                  },
                ),
              ),
              Text(" cuadras"),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'P5. ¿Cuántas veces por semana tiene clases de Educación Física en la escuela?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          RadioListTile(
            title: Text('1 vez por semana'),
            value: 1,
            groupValue: p5Value,
            onChanged: (value) {
              setState(() {
                p5Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('2 veces por semana'),
            value: 2,
            groupValue: p5Value,
            onChanged: (value) {
              setState(() {
                p5Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('3 veces por semana'),
            value: 3,
            groupValue: p5Value,
            onChanged: (value) {
              setState(() {
                p5Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('4 veces por semana'),
            value: 4,
            groupValue: p5Value,
            onChanged: (value) {
              setState(() {
                p5Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('5 veces por semana'),
            value: 5,
            groupValue: p5Value,
            onChanged: (value) {
              setState(() {
                p5Value = value;
              });
            },
          ),
          RadioListTile(
            title: Text('6 veces por semana'),
            value: 6,
            groupValue: p5Value,
            onChanged: (value) {
              setState(() {
                p5Value = value;
              });
            },
          ),

          SizedBox(height: 16),
          Text(
            'P6. ¿Cuántas horas por día pasa frente a una pantalla de computadora, taabled celular o televisor?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45.0,
                color: Colors.yellow[100],
                child: TextField(
                  controller: p4Controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      p4Value = int.tryParse(value);
                    });
                  },
                ),
              ),
              Text("  horas"),
            ],
          ),
        ],
      ),
    );
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
}
