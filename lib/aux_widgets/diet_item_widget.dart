import 'package:flutter/cupertino.dart';

class DietItem extends StatelessWidget {
  final int itemIndex; // The index of this item in the list
  final int? groupValue; // The currently selected option (0, 1, or 2) or null
  final String title;
  final List<String> opciones;
  final void Function(int itemIndex, int selection) onChanged;

  const DietItem({
    super.key, // Important for testing and list performance
    required this.itemIndex,
    required this.groupValue,
    required this.title,
    required this.opciones,
    required this.onChanged,
  });

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
            onValueChanged: (int? value) {
              if (value != null) onChanged(itemIndex, value);
            },
            groupValue: groupValue,
          ),
        ],
      ),
    );
  }
}
