import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipsandtricks/widgets/adding_animated_list.dart';

const image_urls = [
  'https://cnn.it/3xu58Ap',
  'https://cnn.it/2VcCSow',
  'https://cnn.it/3A3zStC',
  'https://cnn.it/2TNY7wi'
];

extension ToNetworkImage<T extends String> on List<T> {
  List<Widget> toNetworkImages() => map((e) => Image.network(e)).toList();
}

class GitterFree extends StatefulWidget {
  const GitterFree({Key? key}) : super(key: key);

  @override
  State<GitterFree> createState() => _GitterFreeState();
}

class _GitterFreeState extends State<GitterFree> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gitter Free'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IndexedStack(
              index: _currentIndex,
              children: imageUrls.toNetworkImages(),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _currentIndex++;
                    if (_currentIndex >= imageUrls.length) {
                      _currentIndex = 0;
                    }
                  });
                },
                child: const Text('Go to next Season'))
          ],
        ),
      ),
    );
  }
}
