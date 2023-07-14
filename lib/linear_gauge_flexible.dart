import 'package:flutter/material.dart';

const double frameWidth = 3.0;

class LinearGaugeFlexible extends StatefulWidget {
  final int? valueToSignal;

  const LinearGaugeFlexible({
    super.key,
    required this.valueToSignal,
  });

  @override
  State<LinearGaugeFlexible> createState() => _LinearGaugeFlexibleState();
}

class _LinearGaugeFlexibleState extends State<LinearGaugeFlexible> {
  @override
  Widget build(BuildContext context) {
    var valor = widget.valueToSignal;

    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(246, 101, 55, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(248, 134, 56, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(251, 168, 57, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(253, 201, 58, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(210, 220, 64, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(182, 215, 64, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(121, 190, 75, 1.0),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: showBoxDecoration(0, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(1, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(2, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(3, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(4, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(5, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(6, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(7, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(8, valor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: showBoxDecoration(9, valor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  BoxDecoration? showBoxDecoration(int position, int? value) {
    return ((value != null && value == position)
        ? BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: frameWidth,
            ),
          )
        : null);
  }
}
