import 'package:flutter/cupertino.dart';

class DietItem extends StatelessWidget {
  final void Function(List<int?>,int) callback;
  final List<int?> index;
  final String title;
  final List<String> opciones;

  const DietItem({super.key, required this.callback, required this.index, required this.title, required this.opciones});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: Text(title)),
          CupertinoSegmentedControl<int>(
            children: {
              0: Padding(padding: const EdgeInsets.all(8.0), child: Text(opciones[0])),
              1: Padding(padding: const EdgeInsets.all(8.0), child: Text(opciones[1])),
              2: Padding(padding: const EdgeInsets.all(8.0), child: Text(opciones[2])),
            },
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            onValueChanged: (value) {
              callback(index, value);
              debugPrint(value.toString());
              } ,
            groupValue: index[0],
          ),
        ],
      ),
    );
  }
}
