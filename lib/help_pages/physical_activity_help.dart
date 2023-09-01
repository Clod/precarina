import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

const englishText ="Physical activity is of vital importance for children's health. Participating in regular physical activities not only promotes their physical development but also contributes to their emotional and mental well-being. Exercise helps strengthen muscles and bones, improves motor coordination and cardiovascular ability, and helps maintain a healthy weight. Furthermore, physical activity helps children release energy, reduce stress, and improve their mood. Encouraging physical activity habits from an early age lays the foundation for a healthy lifestyle in the future, thus promoting their optimal growth and development.";
const spanishText ="La actividad física es de vital importancia para la salud de los niños. Participar en actividades físicas regulares no solo promueve su desarrollo físico, sino que también contribuye a su bienestar emocional y mental. El ejercicio ayuda a fortalecer los músculos y los huesos, mejora la coordinación motora y la habilidad cardiovascular, y ayuda a mantener un peso saludable. Además, la actividad física ayuda a los niños a liberar energía, reducir el estrés y mejorar su estado de ánimo. Fomentar hábitos de actividad física desde temprana edad sienta las bases para un estilo de vida saludable en el futuro, promoviendo así su crecimiento y desarrollo óptimos.";

class PhysicalActivityHelp extends StatelessWidget {
  const PhysicalActivityHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

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
            padding: const EdgeInsets.all(20.0),
            child: HtmlWidget(localizedValues[locale.languageCode]!['title']!
              //htmlData,
              //"txtCholesterolHelp".i18n(),
            ),
          ),
        ),
      ),
    );
  }
}
