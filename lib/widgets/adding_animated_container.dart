// here we base our solution on an enum called orinentaion
// that provides us
// 1) image to show
// 2) ability to flip the orientation
// 3) ability to retrive background color

// note -> Landscap and portrait are just names to identify two diffrent images 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Orientation { portrait, landscape }

extension on Orientation {
  Image get image {
    switch (this) {
      case Orientation.portrait:
        return Image.network('https://picsum.photos/250?image=9');
      case Orientation.landscape:
        return Image.network('https://picsum.photos/250?image=10');
    }
  }

  Orientation get flipped => this == Orientation.portrait
      ? Orientation.landscape
      : Orientation.portrait;

  Size size(BuildContext context) {
    switch (this) {
      case Orientation.portrait:
        final width = MediaQuery.of(context).size.width;
        final height = width / (5.0 / 7.0);
        return Size(width, height);

      case Orientation.landscape:
        final width = MediaQuery.of(context).size.width;
        final height = width / (16.0 / 9.0);
        return Size(width, height);
    }
  }

  Color? get backgroundColor =>
      this == Orientation.portrait ? Colors.orange[200] : Colors.pink[300];
}

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  Orientation orientation = Orientation.portrait;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => orientation = orientation.flipped);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              curve: Curves.easeInOutCubic,
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                color: orientation.backgroundColor,
              ),
              width: orientation.size(context).width,
              height: orientation.size(context).height,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: orientation.image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
