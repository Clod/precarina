import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:localization/localization.dart';

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

var data = "Lípidos: la dislipidemia presente en la infancia se arrastra hacia la adultez y es un marcador de riesgo"
    "para el desarrollo de aterosclerosis."
    "En la obesidad generalmente se encuentra un aumento de los niveles de triglicéridos, bajo colesterol de"
    "HDL y leve aumento del colesterol de >LDL.\n"
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

const textSpanish = r"""
<p>Lípidos: la dislipidemia presente en la infancia se arrastra hacia la adultez y es un marcador de riesgo para el desarrollo de aterosclerosis. En la obesidad generalmente se encuentra un aumento de los niveles de triglicéridos, bajo colesterol de HDL y y leve aumento del colesterol LDL.</p>
<table cellspacing="0" cellpadding="5" style=" font-size: 0.65em; height: 307px; border: 1px solid black; border-collapse: collapse; border: 4px solid black; margin-left: auto; margin-right: auto;">
<tbody>
<tr style="height: 57px; ">
<td style="border: 1px solid black; height: 57px; width: 147.227px;"></td>
<td style="border: 1px solid black; height: 57px; width: 92.4453px; text-align: center;">
ACEPTABLE
</td>
<td style="border: 1px solid black; height: 57px; width: 76.7891px; text-align: center;">
LIMITE
</td>
<td style="border: 1px solid black; height: 57px; width: 53.3125px; text-align: center;">
ALTO
</td>
</tr>
<tr style="height: 50px;">
<td style="border: 1px solid black; height: 50px; width: 147.227px;">
<pre>Trig. 0-9 años</pre>
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 92.4453px;">
≤75
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 76.7891px;">
75-99
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 53.3125px;">
≥100
</td>
</tr>
<tr style="height: 50px;">
<td style="border: 1px solid black; height: 50px; width: 147.227px;">
<pre>Trig. 10-19 años</pre>
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 92.4453px;">
≤ 90
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 76.7891px;">
90-129
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 53.3125px;">
≥130
</td>
</tr>
<tr style="height: 50px;">
<td style="border: 1px solid black; height: 50px; width: 147.227px;">
<pre>Col LDL</pre>
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 92.4453px;">
≤110
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 76.7891px;">
110-129
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 53.3125px;">
≥130
</td>
</tr>
<tr style="height: 50px;">
<td style="border: 1px solid black; height: 50px; width: 147.227px;">
<pre>Col HDL</pre>
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 92.4453px;">
≥170
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 76.7891px;">
170-199
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 53.3125px;">
≥200
</td>
</tr>
<tr style="height: 50px;">
<td style="border: 1px solid black; height: 50px; width: 147.227px;">
<pre>Col Total</pre>
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 92.4453px;">
≥45
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 76.7891px;">
40-45
</td>
<td style="border: 1px solid black; text-align: center; height: 50px; width: 53.3125px;">
≤40
</td>
</tr>
</tbody>
</table>
<p></p>
<p></p>
<p><strong>Bibliografía</strong></p>
<p>Consenso sobre manejo de las dislipidemias en pediatría. Arch. Argent. Pediatr. 2015;113(2):177-186.</p>
""";

class CholesterolHelp extends StatelessWidget {
  const CholesterolHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'title': textSpanish,
    },
    'es': {
      'title': textSpanish,
    },
  };

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: HtmlWidget(
                _localizedValues[locale.languageCode]!['title']!
              //htmlData,
              //"txtCholesterolHelp".i18n(),
            ),
          ),
        ),
      ),
    );
  }
}
