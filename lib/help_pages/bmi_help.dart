import 'package:flutter/material.dart';

class BmiHelp extends StatelessWidget {
  const BmiHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("El índice de masa corporal (IMC) es una medida simple y confiable para evaluar el estado nutricional de una persona adulta. Se calcula dividiendo el peso de la persona en kilos por el cuadrado de su altura en metros. Un IMC entre 18.5 y 24.9 se considera normal, mientras que un IMC por debajo de 18.5 indica bajo peso y por encima de 25 sobrepeso. El IMC provee una buena estimación del contenido de grasa corporal y se relaciona con el riesgo de enfermedades crónicas. Sin embargo, tiene limitaciones ya que no distingue entre masa grasa y masa muscular. Por esto, el IMC debe interpretarse en el contexto de la evaluación clínica general de cada individuo."),
        )
      ),
    );
  }
}
