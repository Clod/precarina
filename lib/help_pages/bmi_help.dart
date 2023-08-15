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

  final data = "El índice de masa corporal (IMC) es el criterio más usado para medir la masa corporal en" "relación a la altura y el indicador práctico y universalmente aplicable, barato y no invasivo" "para identificar el sobrepeso y la obesidad. En niños y adolescentes no hay valores absolutos (" "por las modificaciones con la edad) sino que se dispone de tablas de percentilos que definen"
  "sobrepeso (> Plo 85 y < Plo 97 ) y obesidad (>Plo 97)."
  "#  \n"
  "#  \n"
  "### Bibliografía\n"
  "Manual de Obesidad en Pediatría. Editorial Lugones. 2023\n"
  ;

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
