import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;

  const VerticalSpace({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

