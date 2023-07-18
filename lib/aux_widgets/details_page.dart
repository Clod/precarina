import 'package:flutter/cupertino.dart';

class DetailsPage extends StatelessWidget {

  final BuildContext context;

  const DetailsPage({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Details'),
        previousPageTitle: 'Home',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Acá se podría poner info sobre alimentos'),
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
