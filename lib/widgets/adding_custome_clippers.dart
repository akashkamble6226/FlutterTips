import 'package:flutter/material.dart';
import 'dart:math' show min;

const gridImages = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/3jRSRCu',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

class MyCustomeClippers extends StatelessWidget {
  const MyCustomeClippers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView.count(
        padding: const EdgeInsets.fromLTRB(8.5, 48.0,8.0, 48.0),
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: gridImages.map((url) => NetWorkImageWithProgress(url: url)).toList(),
        ),
      
    );
  }
}


class NetWorkImageWithProgress extends StatefulWidget {
  final String url;
  


  const NetWorkImageWithProgress({ Key? key,required this.url }) : super(key: key);
  
  @override
  _NetWorkImageWithProgressState createState() => _NetWorkImageWithProgressState();
}

class _NetWorkImageWithProgressState extends State<NetWorkImageWithProgress> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<double>  _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 1));

    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(widget.url,fit: BoxFit.fitHeight,
    frameBuilder: (context,child,frame,wasSynchrounouslyLoaded){
      _controller.reset();
      _controller.forward();
      return FadeTransition(opacity: _animation,
      child: CustomeBox(
        child:child,
      ),
      );

    },
    loadingBuilder: (context,child,loadingProgress)
    {
      final totalBytes = loadingProgress?.expectedTotalBytes;
      final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if(totalBytes != null && bytesLoaded != null)
        {
          return CustomeBox(
            child:
            CircularProgressIndicator(backgroundColor: Colors.white70,  value: bytesLoaded/totalBytes,
            color: Colors.blue[900],
            strokeWidth: 5.0,
            ),
          );
        }

        else
        {
          return child;
        }

    },

    errorBuilder: (context,error,stackTrace){
      return const Text('Error!');
    }
    
    
    );
  }
}

class CustomeBox extends StatelessWidget {
  final Widget child;
  const CustomeBox({ Key? key,required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: child is ProgressIndicator ? Center(child: child,):Circular(child:child),
      
    );
  }
}


class Circular extends StatelessWidget {
  final Widget child;

  const Circular({ Key? key,required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircularClipper(),
      child: child,
      
    );
  }
}


class CircularClipper extends CustomClipper<Rect>
{
  @override  
  Rect getClip(Size size) {
    // TODO: implement getClip
    final center  = Offset(size.width/2.0 ,size.height/2.0);

    final minWidthOrHeight  = min(size.width,size.height);

    return Rect.fromCenter(center: center, width: minWidthOrHeight, height: minWidthOrHeight);
    throw UnimplementedError();
    
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
