import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {

  final BuildContext context;

  const SettingsPage({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
        previousPageTitle: 'Home',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Acá se podría poner ifo sobre los criterios de puntuación'),
            const SizedBox(height: 20),
            CupertinoButton(
              child: const Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
