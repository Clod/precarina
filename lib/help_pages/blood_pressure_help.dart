import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodPressureHelp extends StatelessWidget {
  const BloodPressureHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  final data = "## Criterio de evaluación de la PA  \n"
      "Las variables se basan en las guías de interpretación y uso de las nuevas tablas de referencia de presión arterial para niños, niñas y adolescentes del PROGRAMA NACIONAL DE SALUD ESCOLAR (PROSANE) Ministerio de Salud de la Nación Argentina (Enero 2020), en el Consenso de prevención cardiovascular en la infancia y la adolescencia conjunto de la Sociedad Argentina de Cardiología y de la Sociedad Argentina de Pediatría y en el consenso de Hipertensión arterial conjunto de la Sociedad Argentina de Cardiología, la Federación Argentina de Cardiología y Sociedad Argentina de Hipertensión Arterial.\nLos puntajes para cada variable se realizaron manteniendo la opinión de expertos de AHA en el articulo **Life’s Essential 8: Updating and Enhancing the American Heart Association’s Construct Cardiovascular Health: A Presidential Advisory From the American Heart Association.** \n"
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "- Interpretación y uso de las nuevas tablas de referencia de presión arterial para niños, niñas y adolescentes del PROGRAMA NACIONAL DE SALUD ESCOLAR (PROSANE) Ministerio de Salud de la Nación Argentina (Enero 2020).\n"
      "[links] (https://bancos.salud.gob.ar/recurso/interpretacion-y-uso-de-las-nuevas-tablas-de-referencia-de-presion-arterial-para-ninos)\n"
      "- Sociedad Argentina de Cardiología; Sociedad Argentina de Pediatría. Consenso de prevención cardiovascular en la infancia y la adolescencia. Versión resumida. Recomendaciones [Consensus on Cardiovascular Prevention in Childhood and Adolescence. Brief version. Recommendations]. Arch Argent Pediatr. 2019 Dec 1;117(6):S205-S242. Spanish. doi: 10.5546/aap.2019.S205. PMID: 31758893.\n"
      "- Consenso Argentino de Hipertensión Arterial. SOCIEDAD ARGENTINA DE CARDIOLOGÍA FEDERACIÓN ARGENTINA DE CARDIOLOGÍA SOCIEDAD ARGENTINA DE HIPERTENSIÓN ARTERIAL. Revista Argentina de Cardiologia. 2018. Vol 86 supl 2.\n";

  // final data = "\n";

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Criterio de evaluación de la PA\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buildBlankLine(),
                      const TextSpan(
                        text: 'Las variables se basan en las guías de interpretación y uso de las nuevas tablas de referencia de presión arterial para niños, niñas y adolescentes del PROGRAMA NACIONAL DE SALUD ESCOLAR (PROSANE) Ministerio de Salud de la Nación Argentina (Enero 2020), en el Consenso de prevención cardiovascular en la infancia y la adolescencia conjunto de la Sociedad Argentina de Cardiología y de la Sociedad Argentina de Pediatría y en el consenso de Hipertensión arterial conjunto de la Sociedad Argentina de Cardiología, la Federación Argentina de Cardiología y Sociedad Argentina de Hipertensión Arterial.\n\nLos puntajes para cada variable se realizaron manteniendo la opinión de expertos de AHA en el articulo: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      const TextSpan(
                        text: 'Life’s Essential 8: Updating and Enhancing the American Heart Association’s Construct Cardiovascular Health: A Presidential Advisory From the American Heart Association.\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buildBlankLine(),
                      buildBlankLine(),
                      const TextSpan(
                        text: 'Bibliografía\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        children: [
                          buildBlankLine(),
                          buildBullet(),
                          const TextSpan(
                            text:
                                'Interpretación y uso de las nuevas tablas de referencia de presión arterial para niños, niñas y adolescentes del PROGRAMA NACIONAL DE SALUD ESCOLAR (PROSANE) Ministerio de Salud de la Nación Argentina (Enero 2020). ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text:
                                'https://bancos.salud.gob.ar/recurso/interpretacion-y-uso-de-las-nuevas-tablas-de-referencia-de-presion-arterial-para-ninos \n',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse(
                                    'https://bancos.salud.gob.ar/recurso/interpretacion-y-uso-de-las-nuevas-tablas-de-referencia-de-presion-arterial-para-ninos'));
                              },
                          ),
                          buildBlankLine(),
                          buildBullet(),
                          const TextSpan(
                            text:
                                'Sociedad Argentina de Cardiología; Sociedad Argentina de Pediatría. Consenso de prevención cardiovascular en la infancia y la adolescencia. Versión resumida. Recomendaciones [Consensus on Cardiovascular Prevention in Childhood and Adolescence. Brief version. Recommendations]. Arch Argent Pediatr. 2019 Dec 1;117(6):S205-S242. Spanish. doi: 10.5546/aap.2019.S205. PMID: 31758893.\n',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          buildBlankLine(),
                          buildBullet(),
                          const TextSpan(
                            text:
                                'Consenso Argentino de Hipertensión Arterial. SOCIEDAD ARGENTINA DE CARDIOLOGÍA FEDERACIÓN ARGENTINA DE CARDIOLOGÍA SOCIEDAD ARGENTINA DE HIPERTENSIÓN ARTERIAL. Revista Argentina de Cardiologia. 2018. Vol 86 supl 2\n',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextSpan buildBlankLine() => const TextSpan(text: "\n");

  TextSpan buildBullet() {
    return const TextSpan(
      text: '• ',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
