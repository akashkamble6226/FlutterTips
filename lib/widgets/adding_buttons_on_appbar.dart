import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showTextDialog({
  required BuildContext context,
  required String text,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ok'),
            )
          ],
        );
      });
}

class MyAppBarButtons extends StatelessWidget {
  const MyAppBarButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await showTextDialog(context: context, text: 'Setting is Pressed');
          },
          icon: Icon(Icons.settings_display),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showTextDialog(context: context, text: 'Create Remainder');
            },
            icon: const Icon(Icons.access_alarm),
          )
        ],
        title: const Text('Flutter App Bar'),
      ),
    );
  }
}
