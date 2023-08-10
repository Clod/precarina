import 'package:flutter/material.dart';

class DiabetesHelp extends StatelessWidget {
  const DiabetesHelp({
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
        child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("La presencia de diabetes en la niñez plantea una serie de peligros y riesgos importantes para la salud a corto y largo plazo. La diabetes tipo 1, que es más común en niños y adolescentes, se caracteriza por la incapacidad del cuerpo para producir insulina, una hormona necesaria para regular los niveles de azúcar en la sangre.\n"

    "Uno de los peligros inmediatos de la diabetes en la niñez es la hiperglucemia, es decir, niveles elevados de azúcar en la sangre. Esto puede llevar a síntomas como sed excesiva, micción frecuente, cansancio y pérdida de peso inexplicada. A largo plazo, la hiperglucemia no controlada puede dañar los vasos sanguíneos y los órganos, lo que aumenta el riesgo de complicaciones graves, como enfermedades cardiovasculares, enfermedad renal, problemas oculares y daño nervioso.\n"

    "Además, la diabetes en la niñez puede afectar la calidad de vida de los niños. Requiere una gestión constante y cuidadosa de la enfermedad, lo que implica monitorizar los niveles de azúcar en la sangre, administrar insulina y seguir una dieta equilibrada. El tratamiento de la diabetes puede ser estresante y exigente tanto para los niños como para sus familias, y puede afectar su participación en actividades cotidianas, como la escuela, el deporte y las salidas sociales.\n"

    "Es importante destacar que la diabetes en la niñez también aumenta el riesgo de desarrollar otras enfermedades crónicas a lo largo de la vida. Los niños con diabetes tienen una mayor probabilidad de desarrollar obesidad, hipertensión arterial y enfermedades cardiovasculares en comparación con sus pares sin diabetes.\n"

    "Para prevenir y controlar los peligros de la diabetes en la niñez, es fundamental un diagnóstico temprano y un manejo adecuado de la enfermedad. Esto implica un seguimiento regular con profesionales de la salud, educación sobre la diabetes y apoyo emocional tanto para los niños como para sus familias. Además, fomentar un estilo de vida saludable, que incluya una dieta equilibrada y actividad física regular, puede ayudar a prevenir complicaciones y mejorar la calidad de vida de los niños con diabetes.\n"

    "En resumen, la diabetes en la niñez representa peligros tanto a corto como a largo plazo para la salud. El control adecuado de la enfermedad, junto con un estilo de vida saludable, es fundamental para reducir los riesgos y promover un buen bienestar en los niños con diabetes."),
        ))
      ),
    );
  }
}
