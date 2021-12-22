import 'package:flutter/material.dart';

class MyAnimatedIcon extends StatefulWidget {
  const MyAnimatedIcon({Key? key}) : super(key: key);

  @override
  _MyAnimatedIconState createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat(reverse: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icon'),
      ),
      body: Center(
        child: AnimatedIcon(
          color: Colors.green[300],
          icon: AnimatedIcons.search_ellipsis,
          size: MediaQuery.of(context).size.width,
          progress: _animation,
        ),
      ),
    );
  }
}
