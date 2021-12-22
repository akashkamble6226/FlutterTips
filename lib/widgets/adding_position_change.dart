import 'package:flutter/material.dart';

class AddingPositionedChange extends StatefulWidget {
  const AddingPositionedChange({Key? key}) : super(key: key);

  @override
  _AddingPositionedChangeState createState() => _AddingPositionedChangeState();
}

class _AddingPositionedChangeState extends State<AddingPositionedChange> {
  var isMovedUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPositioned in flutter'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isMovedUp = !isMovedUp),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.network('https://bit.ly/2VcCSow'),
              const Text(
                'Summer 😍',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                bottom: isMovedUp ? 140 : 10.0,
                curve: Curves.elasticInOut,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:const NetworkImage('https://bit.ly/3cXWD9j'),
                  backgroundColor: Colors.orange[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
