import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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

  final data = "El índice de masa corporal (IMC) es el criterio más usado para medir la masa corporal en"
      "relación a la altura y el indicador práctico y universalmente aplicable, barato y no invasivo"
      "para identificar el sobrepeso y la obesidad.\n"
      "#  \n"
      "En niños y adolescentes, se utilizan tablas de percentiles para definir el sobrepeso (> percentil 85 y < percentil 95), la obesidad (> percentil 95) y la obesidad grave (> percentil 99). Por lo tanto, para la aplicación PRECARINA, entrenamos un modelo de Machine Learning con datos de la Organización Mundial de la Salud (OMS) y el Centro Nacional de Salud para estimar el percentil del IMC."
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "Manual de Obesidad en Pediatría. Editorial Lugones. 2023\n";

  /*
  BMI: It is the most commonly used criterion to measure body mass in relation to height and is a practical and universally applicable indicator. It is a cost-effective and non-invasive method to identify overweight and obesity. In children and adolescents, there are no absolute values (due to modifications with age), but instead, percentile tables are used to define overweight (> 85th percentile and < 97th percentile) and obesity (> 97th percentile).
However, tables and graphics are not a convenient way to determine percentile values and are almost rather error-prone. Therefore, for the PRACARINA app, we trained a Machine Learning model with data from the World Health Organization (WHO) and the National Center for Health Statistics (NCHS) from 2007. This approach allows users to simply enter the necessary data for calculating BMI (namely height and weight). Subsequently, the model utilizes the calculated BMI and the patient's age to estimate the appropriate BMI percentile.
   */

  final spanishText = r"""
  <p>
	El &iacute;ndice de masa corporal (IMC) es el criterio m&aacute;s usado para medir la masa corporal en relaci&oacute;n a la altura y el indicador pr&aacute;ctico y universalmente aplicable, barato y no invasivo para identificar el sobrepeso y la obesidad.
</p>
<p>
	En ni&ntilde;os y adolescentes, se utilizan tablas de percentiles para definir el sobrepeso (&gt; percentil 85 y &lt; percentil 95), la obesidad (&gt; percentil 95) y la obesidad grave (&gt; percentil 99). Por lo tanto, para la aplicaci&oacute;n PRECARINA, entrenamos un modelo de Machine Learning con datos de la Organizaci&oacute;n Mundial de la Salud (OMS) y el Centro Nacional de Salud para estimar el percentil del IMC.
</p>
<p>
	<strong>
		Bibliograf&iacute;a
	</strong>
	<br />
	Manual de Obesidad en Pediatr&iacute;a. Editorial Lugones. 2023
</p>
  """;

  final englishText = r"""
  <p>
	The body mass index (BMI) is the most commonly used criterion to measure body mass in relation to height and is a practical and universally applicable indicator. It is a cheap and non-invasive method to identify overweight and obesity.
</p>
<p>
	In children and adolescents, percentile charts are used to define overweight (&gt; 85th percentile and &lt; 95th percentile), obesity (&gt; 95th percentile), and severe obesity (&gt; 99th percentile). Therefore, for the PRECARINA application, we trained a Machine Learning model using data from the World Health Organization (WHO) and the National Health Center to estimate the BMI percentile.
</p>
<p>
	<strong>
		 Bibliography
	</strong>
	<br />
	Manual de Obesidad en Pediatría. Editorial Lugones. 2023
</p>
  """;

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

    final localizedValues = <String, Map<String, String>>{
      'en': {
        'title': englishText,
      },
      'es': {
        'title': spanishText,
      },
    };

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
            padding: const EdgeInsets.all(18.0),
            child: HtmlWidget(
        localizedValues[locale.languageCode]!['title']!
        /*
            Html(
                data: "txtBmiHelp".i18n(),
                onLinkTap: (url, context, map) async {
                  if (await canLaunchUrl(Uri.parse(url!))) {
                    await launchUrl(Uri.parse(url!));
                  } else {
                    throw 'Could not launch $url';
                  }
                }*/),
          ),
        ),
      ),
    );
  }
}
