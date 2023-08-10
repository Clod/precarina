import 'package:flutter/material.dart';

class DietHelp extends StatelessWidget {
  const DietHelp({
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
            child: Text(
                "Mantener una dieta saludable es de suma importancia para nuestro bienestar y calidad de vida. Nuestra alimentación tiene un impacto directo en nuestra salud física y mental, y puede influir en la prevención de diversas enfermedades crónicas.\n"
                "Una dieta saludable proporciona los nutrientes esenciales que nuestro cuerpo necesita para funcionar correctamente. Incluye una variedad de alimentos frescos y naturales, como frutas, verduras, granos enteros, proteínas magras y grasas saludables. Estos alimentos nos brindan vitaminas, minerales, antioxidantes y fibra dietética, que son fundamentales para el buen funcionamiento del organismo.\n"
                "Una de las principales ventajas de una dieta saludable es el control del peso corporal. Consumir alimentos equilibrados y moderar las porciones nos ayuda a mantener un peso adecuado y prevenir la obesidad. El sobrepeso y la obesidad están asociados con numerosos problemas de salud, como enfermedades cardíacas, diabetes tipo 2, hipertensión y ciertos tipos de cáncer. Al adoptar una dieta saludable, reducimos el riesgo de desarrollar estas enfermedades y promovemos un peso saludable.\n"
                "Además, una alimentación adecuada fortalece nuestro sistema inmunológico, lo que nos ayuda a prevenir enfermedades e infecciones. Los nutrientes presentes en una dieta equilibrada contribuyen a la producción de glóbulos blancos, anticuerpos y otras sustancias que nos protegen contra virus y bacterias. Una dieta deficiente puede debilitar nuestras defensas y hacernos más susceptibles a enfermedades.\n"
                "Asimismo, una dieta saludable tiene un impacto positivo en nuestra salud mental. Estudios han demostrado que una alimentación balanceada puede reducir el riesgo de depresión, ansiedad y otros trastornos mentales. Algunos nutrientes, como los ácidos grasos omega-3 y ciertas vitaminas del complejo B, desempeñan un papel crucial en la función cerebral y en la regulación del estado de ánimo.\n"
                "En resumen, mantener una dieta saludable es esencial para preservar nuestra salud y bienestar. No se trata solo de contar calorías, sino de elegir alimentos nutritivos que nos proporcionen los elementos necesarios para un funcionamiento óptimo del cuerpo y la mente. Al hacerlo, podemos prevenir enfermedades, controlar nuestro peso, fortalecer nuestro sistema inmunológico y mejorar nuestra salud mental. Adoptar buenos hábitos alimentarios es una inversión a largo plazo en nuestra calidad de vida.\n"),
          ),
        ),
      ),
    );
  }
}
