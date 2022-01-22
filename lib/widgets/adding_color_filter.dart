import 'package:flutter/material.dart';

class ColorFilter extends StatefulWidget {
  const ColorFilter({Key? key}) : super(key: key);

  @override
  _ColorFilterState createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {
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
                sliderValue = value;
              })
        ],
      ),
    );
  }
}
