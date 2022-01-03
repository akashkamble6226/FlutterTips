import 'package:flutter/material.dart';

class AspectR extends StatelessWidget {
  const AspectR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aspect Ratio'),
        ),
        body: Center(
          child: LayoutBuilder(
            builder: (
              context,
              constraint,
            ) {
              return Container(
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        'https://bit.ly/3oIwwrA',
                        fit: BoxFit.fitHeight,
                        frameBuilder: (_, child, __, ___) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: child,
                          );
                        },
                      )));
            },
          ),
        ));
  }
}
