import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BaseColor { red, green, blue }

extension Title on BaseColor {
  String get title => describeEnum(this).capitalize();
}

typedef OnColorChnaged = void Function(int);

class ColorTile extends StatelessWidget {
  final BaseColor baseColor;
  final OnColorChnaged onColorChanged;

  const ColorTile(
      {Key? key, required this.baseColor, required this.onColorChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Enter ${baseColor.title} color here: (0-255)'),
      trailing: Container(
        width: 100,
        child: TextField(
          onChanged: (strValue) {
            onColorChanged(int.tryParse(strValue) ?? 0);
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            TextInputFormatter.withFunction((oldValue, newValue) {
              if (newValue.text.isEmpty) {
                return newValue;
              }

              try {
                final value = int.parse(newValue.text);

                return value <= 255 ? newValue : oldValue;
              } on FormatException catch (_) {
                return oldValue;
              }
            })
          ],
        ),
      ),
    );
  }
}

extension Caps on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
}

class CustomeColorComponet extends StatefulWidget {
  const CustomeColorComponet({Key? key}) : super(key: key);

  @override
  _CustomeColorComponetState createState() => _CustomeColorComponetState();
}

class _CustomeColorComponetState extends State<CustomeColorComponet> {
  int _red = 0;
  int _green = 0;
  int _blue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
      ),
      body: ListView(
        children: [
          ColorTile(
            baseColor: BaseColor.red,
            onColorChanged: (red) =>setState(() {
               _red = red;
              
            }),
          ),
          ColorTile(
            baseColor: BaseColor.green,
            onColorChanged: (green) => setState(() {
               _green = green;
              
            }),
          ),
          ColorTile(
            baseColor: BaseColor.blue,
            onColorChanged: (blue) => setState(() {
               _blue = blue;
              
            }),
          ),
          Container(
            height: 200,
            color: Color.fromRGBO(_red, _green, _blue, 1.0),
            child: const Center(
              child: Text('Your chosen color appers here',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 40),),
              
            ),
          )
        ],
      ),
    );
  }
}
