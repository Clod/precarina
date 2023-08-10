import 'package:flutter/material.dart';

class SmokeExposureHelp extends StatelessWidget {
  const SmokeExposureHelp({
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
                    "La exposición de un niño al humo de tabaco, vaporizadores y otras sustancias similares puede tener efectos perjudiciales significativos para su salud y bienestar.\n"
                    "En primer lugar, el humo de tabaco contiene más de 7,000 sustancias químicas, muchas de las cuales son tóxicas y carcinógenas. Cuando un niño inhala este humo de segunda mano, puede experimentar una serie de problemas respiratorios, como asma, bronquitis y neumonía. Además, la exposición al humo de tabaco aumenta el riesgo de muerte súbita del lactante, una condición en la cual un bebé sano muere repentinamente durante el sueño.\n"
                    "Los vaporizadores, también conocidos como cigarrillos electrónicos, también presentan riesgos para los niños. Aunque a menudo se perciben como una alternativa más segura al tabaco, los vaporizadores emiten sustancias químicas dañinas y partículas finas que pueden dañar los pulmones en desarrollo de los niños. Además, algunos líquidos utilizados en los vaporizadores contienen nicotina, que es altamente adictiva y puede afectar el desarrollo cerebral de los niños y adolescentes.\n"
                    "La exposición al humo de tabaco y vaporizadores también puede tener un impacto negativo en el sistema cardiovascular de los niños, aumentando el riesgo de enfermedades cardíacas a largo plazo. Además, se ha observado que los niños expuestos al humo de segunda mano tienen un mayor riesgo de desarrollar problemas de audición, infecciones de oído y retraso en el desarrollo del habla.\n"
                    "Es importante destacar que los niños son especialmente vulnerables a los efectos nocivos del humo de tabaco y los vaporizadores debido a que sus órganos y sistemas están en proceso de crecimiento y desarrollo. Incluso la exposición ocasional puede tener consecuencias graves para su salud a largo plazo.\n"
                    "En resumen, la exposición de un niño al humo de tabaco, vaporizadores y sustancias similares puede ocasionar una serie de perjuicios significativos para su salud, incluyendo problemas respiratorios, riesgo de muerte súbita del lactante, afectación del desarrollo cerebral, riesgo cardiovascular y problemas de audición. Es fundamental proteger a los niños de estas fuentes de humo y promover entornos libres de tabaco y vaporizadores para garantizar su salud y bienestar.\n"),
              ))),
    );
  }
}
