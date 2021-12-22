import 'package:flutter/material.dart';


class Shadow extends StatelessWidget {
  const Shadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding Shadow Icons To Flutter'),
      ),
      body: Center(
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.topCenter,
              // x , y and z position
              transform: Matrix4.identity().scaled(1.03, 1.03, 1.0),
              child: Icon(
                Icons.all_inclusive_sharp,
                color: Colors.black.withAlpha(40),
                size: 256.0,
              ),
            ),
            const Icon(
              Icons.all_inclusive_sharp,
              color: Colors.red,
              size: 256.0,
            ),
          ],
        ),
      ),
    );
  }
}
