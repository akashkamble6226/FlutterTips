import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredImage extends StatefulWidget {
  const BlurredImage({Key? key}) : super(key: key);

  @override
  _BlurredImageState createState() => _BlurredImageState();
}

class _BlurredImageState extends State<BlurredImage> {
  double _blur = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blurred Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://bit.ly/3bQ9kCe',
              alignment: Alignment.topCenter,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: _blur,
                sigmaY: _blur,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: Slider(
                      min: 0.0,
                      max: 10.0,
                      value: _blur,
                      onChanged: (value) {
                        setState(() => _blur = value);
                      },
                    ),
                  ),

                  Text("Currently $_blur blurred !"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
