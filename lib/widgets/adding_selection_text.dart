import 'package:flutter/material.dart';

class SelectText extends StatelessWidget {
  const SelectText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String myUrl = 'https://picsum.photos/250?image=9';
    String myText =
        'Free access to best-selling book Flutter Apprentice, for a limited time only!';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecteble Text'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(myUrl),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SelectableText(
              myText,
              textAlign: TextAlign.center,
              showCursor: false,
              cursorColor: Colors.blue,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                selectAll: true,
                //cut: true,
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
