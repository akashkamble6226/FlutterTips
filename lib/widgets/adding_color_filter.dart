import 'package:flutter/material.dart';

class ColorFilterImage extends StatefulWidget {
  const ColorFilterImage({Key? key}) : super(key: key);

  @override
  _ColorFilterImageState createState() => _ColorFilterImageState();
}

class _ColorFilterImageState extends State<ColorFilterImage> {
  var sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Filter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.orange.withOpacity(sliderValue),
              BlendMode.colorBurn,
            ),
            child: Image.network('https://tinyurl.com/4vtvh35h'),
          ),
          Slider(
              value: sliderValue,
              onChanged: (value) {
               setState(() {
                  sliderValue = value;
               });
              })
        ],
      ),
    );
  }
}
