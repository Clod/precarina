import 'package:flutter/material.dart';
import 'package:precarina/help_pages/precarina_help_widget.dart';
import 'package:precarina/help_pages_texts/diabetes_help_texts.dart';


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
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return PrecarinaHelpWidget(title: title, context: context, spanishText: spanishText, englishText: englishText,);
  }}
