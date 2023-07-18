import 'package:flutter/cupertino.dart';

class VerticalSpace extends StatelessWidget {
  final double altura;

  const VerticalSpace({Key? key, required this.altura}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: altura,
    );
  }
}

