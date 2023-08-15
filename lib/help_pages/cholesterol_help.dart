import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/*
  var data =

"Lípidos: la dislipidemia presente en la infancia se arrastra hacia la adultez y es un marcador de riesgo" "para el desarrollo de aterosclerosis."
"En la obesidad generalmente se encuentra un aumento de los niveles de triglicéridos, bajo colesterol de" "HDL y leve aumento del colesterol de >LDL."
      "#  \n"
      "#  \n"
      "| |ACEPTABLE | LIMITE | ALTO |\n"
      "|---|---|-----------|------------------|\n"
      "| Triglicéridos 0-9 años 10-19 años | ≤75 ≤ 90 | 75-99 90-129 | ≥100 ≥130 |\n"
      "| Col LDL | ≤110 |  110-129 |≥130 |\n"
      "| Col HDL | ≥170 | 170-199 | ≥200 | \n"
      "| Col Total | ≥45 | 40-45 | ≤40 | \n"
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "- Consenso sobre manejo de las dislipidemias en pediatría. Arch Argent Pediatr 2015;113(2):177-186";
*/

var data =
    "Lípidos: la dislipidemia presente en la infancia se arrastra hacia la adultez y es un marcador de riesgo" "para el desarrollo de aterosclerosis."
    "En la obesidad generalmente se encuentra un aumento de los niveles de triglicéridos, bajo colesterol de" "HDL y leve aumento del colesterol de >LDL.\n"
    "#  \n"
    "#  \n"
    "| |ACEPT. | LIMITE | ALTO |\n"
    "|---|-----|-----------|------------------|\n"
    "| Trig. 0-9 años | ≤75 | 75-99 | ≥100 |\n"
    "| Trig. 10-19 años | ≤ 90 | 90-129 | ≥130 |\n"
    "| Col LDL | ≤110 |  110-129 |≥130 |\n"
    "| Col HDL | ≥170 | 170-199 | ≥200 | \n"
    "| Col Total | ≥45 | 40-45 | ≤40 | \n"
    "#  \n"
    "#  \n"
    "### Bibliografía\n"
    "- Consenso sobre manejo de las dislipidemias en pediatría. Arch Argent Pediatr 2015;113(2):177-186";

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
