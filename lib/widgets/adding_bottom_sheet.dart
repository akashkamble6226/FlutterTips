import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bottom Sheet'),
      ),
      body: TextButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              builder: (context) {
                return Container(
                  color: Colors.white,
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0,),
                      Container(width: 50.0, height: 4.0,color: Colors.grey,),
                      const SizedBox(height: 10.0,),
                      const Text('Hello'),


                    ],
                  ),
                );
              });
        },
        child: const Text('Present Options'),
      ),
    );
  }
}
