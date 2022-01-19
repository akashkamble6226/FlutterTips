import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card in flutter'),
      ),
      body: Image.network('https://bit.ly/36fNNj9',
          frameBuilder: (context, child, frame, wasSynchrounouslyLoaded) {
        return Card(
          child: child,
          // if we don't use the antialias then that child may be go outside the card
          clipBehavior: Clip.antiAlias,
        );
      }, loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;

        print(totalBytes);
        print(bytesLoaded);

        if (totalBytes != null && bytesLoaded != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          );
        } else {
          return child;
        }
      }),
    );
  }
}
