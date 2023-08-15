import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


/*

"La Glucemia es un marcador del adecuado metabolismo de los hidratos de carbono.  Normanlmente,"
 "en condiciones de ayuno, la glucemia normal debe ser menor a 100 mg%."
"Se ha comprobado que la obesidad se asocia en la evolución con un progresivo deterioro del"
"metabolismo de los hidratos de carbono que se inicia con ligeras alteraciones en la "
"determinación de la glucemia en ayunas ( prediabetes: Glucemia ≥100 y < 126mg%) y "
"puede llegar al diagnóstico de diabetes (Glucemia ≥ 126 mg%), principalmente en aquellos"
" individuos con antecedentes familiares de diabetes y que no adhieran a cambios en el estilo"
 "de vida ( alimentarios y de actividad física."
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "-ISPAD Clinical Practice Consensus Guidelines 2018: Definition, epidemiology,"
      "and classification of diabetes in children and adolescents."

*/
class DiabetesHelp extends StatelessWidget {
  const DiabetesHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  final data = "La Glucemia es un marcador del adecuado metabolismo de los hidratos de carbono.  Normanlmente,"
      "en condiciones de ayuno, la glucemia normal debe ser menor a 100 mg%."
      "Se ha comprobado que la obesidad se asocia en la evolución con un progresivo deterioro del"
      "metabolismo de los hidratos de carbono que se inicia con ligeras alteraciones en la "
      "determinación de la glucemia en ayunas ( prediabetes: Glucemia ≥100 y < 126mg%) y "
      "puede llegar al diagnóstico de diabetes (Glucemia ≥ 126 mg%), principalmente en aquellos"
      " individuos con antecedentes familiares de diabetes y que no adhieran a cambios en el estilo"
      "de vida (alimentarios y de actividad física.\n"
      "#\n"
      "#\n"
      "### Bibliografía\n"
      "-ISPAD Clinical Practice Consensus Guidelines 2018: Definition, epidemiology,"
      "and classification of diabetes in children and adolescents.";

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
