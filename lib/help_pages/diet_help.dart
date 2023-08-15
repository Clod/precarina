import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


/*
"El entorno alimentario actual se caracteriza por una elevada oferta y accesibilidad de alimentos de "
"alta densidad energética y baja calidad nutricional, con gran contenido de sal, azúcares y grasas, "
"que han reemplazado el consumo de alimentos naturales que aportan fibra, vitaminas y otros minerales "
"entre otros nutrientes beneficiosos para la salud. Esta modificación en los patrones de consumo constituyen "
"un importante riesgo para la salud cardiovascular."

"Se recomienda incorporar a diario alimentos de todos los grupos y realizar al menos 30 minutos de actividad "
"física; tomar a diario 8 vasos de agua segura; consumir a diario 5 porciones de frutas y verduras en variedad "
"de tipo y colores, y reducir el uso de sal y el consumo de alimentos con alto contenido de sodio. "
"Limitar el consumo de bebidas azucaradas y de alimentos con elevado contenido de grasas, azucares y sal; "
"consumir diariamente leche, yogur o quesos, preferentemente descremados; consumir carnes magras, aumentar"
"el consumo de pescado e incluir huevo en la alimentación; consumir legumbres; consumir aceite crudo como "
"condimento, frutos secos o semillas y limitar el consumo de bebidas alcohólicas.\n"
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
"-Manual para la aplicación de la Guías alimentarias para la población argentina. "
https://www.argentina.gob.ar/alimentacion-saludable/comer-sano."
"-Dietary Guidelines for Americans 2020-25. t DietaryGuidelines.gov"
*/

class DietHelp extends StatelessWidget {
  const DietHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  final data = "El entorno alimentario actual se caracteriza por una elevada oferta y accesibilidad de alimentos de "
      "alta densidad energética y baja calidad nutricional, con gran contenido de sal, azúcares y grasas, "
      "que han reemplazado el consumo de alimentos naturales que aportan fibra, vitaminas y otros minerales "
      "entre otros nutrientes beneficiosos para la salud. Esta modificación en los patrones de consumo constituyen "
      "un importante riesgo para la salud cardiovascular.\n"
      "#  \n"
      "Se recomienda incorporar a diario alimentos de todos los grupos y realizar al menos 30 minutos de actividad "
      "física; tomar a diario 8 vasos de agua segura; consumir a diario 5 porciones de frutas y verduras en variedad "
      "de tipo y colores, y reducir el uso de sal y el consumo de alimentos con alto contenido de sodio. "
      "Limitar el consumo de bebidas azucaradas y de alimentos con elevado contenido de grasas, azucares y sal; "
      "consumir diariamente leche, yogur o quesos, preferentemente descremados; consumir carnes magras, aumentar"
      "el consumo de pescado e incluir huevo en la alimentación; consumir legumbres; consumir aceite crudo como "
      "condimento, frutos secos o semillas y limitar el consumo de bebidas alcohólicas.\n"
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "-Manual para la aplicación de la Guías alimentarias para la población argentina. \n"
      "https://www.argentina.gob.ar/alimentacion-saludable/comer-sano."
      "-Dietary Guidelines for Americans 2020-25. t DietaryGuidelines.gov";

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
      body: SafeArea(
        child: Markdown(
          data: data,
          styleSheet: MarkdownStyleSheet(
            em: const TextStyle(
              color: Colors.red,
            ),
            p: const TextStyle(
              fontSize: 14,
            ),
            tableHead: const TextStyle(
              fontSize: 14,
            ),
            tableBody: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
