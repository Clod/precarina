import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double width;

  const HorizontalSpace({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

