import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ContainerAsOval extends StatelessWidget {
  const ContainerAsOval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container as Oval'),
      ),
      body: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.blueGrey,
                    offset: Offset(0.0, 10.0),
                    spreadRadius: 3.0)
              ]),
          width: 300,
          height: 300,
          child: Transform(
            transform: Matrix4.translationValues(-5.0, -10.0, 0.0),
            child: Image.network(
              'https://bit.ly/3wSIS3a',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
