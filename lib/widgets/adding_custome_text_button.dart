import 'package:flutter/material.dart';

class CustomeTextButton extends StatelessWidget {
  const CustomeTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(8.0),
          child: TextButton(
            clipBehavior: Clip.antiAlias,
            style: TextButton.styleFrom(
              elevation: 2,
              backgroundColor: Colors.blue[50],
              shadowColor: Colors.grey[350],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Tap Me',
              style: TextStyle(color: Colors.blue[700]),
            ),
          ),
        ),
      ),
    );
  }
}
