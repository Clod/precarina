import 'package:flutter/material.dart';

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
            child: Text("La actividad física es de vital importancia para la salud de los niños. Participar en actividades físicas regulares no solo promueve su desarrollo físico, sino que también contribuye a su bienestar emocional y mental. El ejercicio ayuda a fortalecer los músculos y los huesos, mejora la coordinación motora y la habilidad cardiovascular, y ayuda a mantener un peso saludable. Además, la actividad física ayuda a los niños a liberar energía, reducir el estrés y mejorar su estado de ánimo. Fomentar hábitos de actividad física desde temprana edad sienta las bases para un estilo de vida saludable en el futuro, promoviendo así su crecimiento y desarrollo óptimos."),
          ),
        )
      ),
    );
  }
}
