import 'package:flutter/material.dart';

class ItemHelp extends StatelessWidget {
  const ItemHelp({
    Key? key,
    required String this.title,
    required String this.content,
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
      body: SafeArea(
        child: Text("Abracadabra")
      ),
    );
  }
}
