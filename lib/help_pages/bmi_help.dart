import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BmiHelp extends StatelessWidget {
  const BmiHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  /*
  var data = "El índice de masa corporal (IMC) es el criterio más usado para medir la masa corporal en" "relación a la altura y el indicador práctico y universalmente aplicable, barato y no invasivo" "para identificar el sobrepeso y la obesidad. En niños y adolescentes no hay valores absolutos (" "por las modificaciones con la edad) sino que se dispone de tablas de percentilos que definen"
              "sobrepeso (> Plo 85 y < Plo 97 ) y obesidad (>Plo 97)."
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "Manual de Obesidad en Pediatría. Editorial Lugones. 2023\n"
   ;
*/

  final data = "El índice de masa corporal (IMC) es el criterio más usado para medir la masa corporal en" "relación a la altura y el indicador práctico y universalmente aplicable, barato y no invasivo" "para identificar el sobrepeso y la obesidad.\n"
      "#  \n"
  "En niños y adolescentes, se utilizan tablas de percentiles para definir el sobrepeso (> percentil 85 y < percentil 95), la obesidad (> percentil 95) y la obesidad grave (> percentil 99). Por lo tanto, para la aplicación PRECARINA, entrenamos un modelo de Machine Learning con datos de la Organización Mundial de la Salud (OMS) y el Centro Nacional de Salud para estimar el percentil del IMC."
  "#  \n"
  "#  \n"
  "### Bibliografía\n"
  "Manual de Obesidad en Pediatría. Editorial Lugones. 2023\n"
  ;

  /*
  BMI: It is the most commonly used criterion to measure body mass in relation to height and is a practical and universally applicable indicator. It is a cost-effective and non-invasive method to identify overweight and obesity. In children and adolescents, there are no absolute values (due to modifications with age), but instead, percentile tables are used to define overweight (> 85th percentile and < 97th percentile) and obesity (> 97th percentile).
However, tables and graphics are not a convenient way to determine percentile values and are almost rather error-prone. Therefore, for the PRACARINA app, we trained a Machine Learning model with data from the World Health Organization (WHO) and the National Center for Health Statistics (NCHS) from 2007. This approach allows users to simply enter the necessary data for calculating BMI (namely height and weight). Subsequently, the model utilizes the calculated BMI and the patient's age to estimate the appropriate BMI percentile.
   */

  @override
  Widget build(BuildContext context) {
    return      Scaffold(
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
