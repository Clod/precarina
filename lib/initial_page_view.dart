import 'package:flutter/material.dart';
import 'package:precarina/main_screen.dart';

class InitialPageView extends StatefulWidget {
  const InitialPageView({super.key});

  @override
  State<InitialPageView> createState() => _InitialPageViewState();
}

class _InitialPageViewState extends State<InitialPageView> {
  bool _isSwipingEnabled = false;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      physics: _isSwipingEnabled ? ScrollPhysics() : NeverScrollableScrollPhysics(),
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isSwipingEnabled = true;
              });
            },
            child: Text('Enable swiping'),
          ),
        ),
        MainScreen(),
        Center(
          child: Text('Third Page'),
        ),
      ],
    );
  }
}
