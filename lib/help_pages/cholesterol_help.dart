import 'package:flutter/material.dart';

class CholesterolHelp extends StatelessWidget {
  const CholesterolHelp({
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Mantener niveles normales de colesterol es de suma importancia para la salud de los niños. El colesterol es una sustancia necesaria para el funcionamiento del cuerpo, pero cuando los niveles están desequilibrados, puede ser perjudicial. El exceso de colesterol puede acumularse en las arterias, obstruyéndolas y dificultando el flujo sanguíneo adecuado. Esto aumenta el riesgo de enfermedades cardiovasculares, como la arteriosclerosis y los problemas cardíacos. Controlar los niveles de colesterol desde la infancia es crucial, ya que los hábitos de alimentación y estilo de vida adquiridos durante esta etapa pueden tener un impacto duradero en la salud. Fomentar una dieta equilibrada, rica en frutas, verduras y alimentos bajos en grasas saturadas, junto con la práctica regular de ejercicio, puede ayudar a mantener el colesterol en niveles saludables y promover una vida sana en el futuro."),
          ),
        )
      ),
    );
  }
}
