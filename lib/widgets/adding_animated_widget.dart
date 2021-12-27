// import 'flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
      reverseDuration: const Duration(seconds: 4),
    );

    _animation = Tween(begin: 0.0, end: 2 * pi).animate(_controller)..addStatusListener((status) {
      
      if(status == AnimationStatus.completed)
      {
        // ignore: avoid_print
        print('It done for first cycle');
      }
    });

     _controller.forward();

    

    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  

  @override
  Widget build(BuildContext context) {  
    
   
_controller.repeat();
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Widget'),),
        body: Center(
          child: AnimatedBuilder(
      animation: _animation,
      builder: (context, image) {
          return Transform.rotate(
            angle: _animation.value,
            child: image,
          );
      },
      child: Image.network('https://bit.ly/3xspdrp'),
    ),
        ));
  }
}
