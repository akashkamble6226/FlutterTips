import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RadioItem<T> {
  final T value;
  final String text;
  const RadioItem({
    required this.text,
    required this.value,
  });
}

Widget radioButtons<T>({
  required int count,
  required RadioItem<T> Function(int) builder,
  required T? groupValue,
  required void Function(T?) onValuChanged,
}) {
  final tiles = Iterable.generate(count, (e) {
    final item = builder(e);
    return ListTile(
      title: Text(item.text),
      leading: Radio<T>(
          value: item.value,
          groupValue: groupValue,
          onChanged: (value) {
            onValuChanged(value);
          }),
    );
  });

  return Column(
    children: tiles.toList(),
  );
}

enum Animal { cat, dog, turtle, rabbit }

extension Caps on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
}

extension on Animal {
  String get Title => describeEnum(this).capitalize();
}

class EnumToRadio extends StatefulWidget {
  const EnumToRadio({Key? key}) : super(key: key);

  @override
  _EnumToRadioState createState() => _EnumToRadioState();
}

class _EnumToRadioState extends State<EnumToRadio> {
  Animal? _animal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is Enum to Radio Button"),
      ),
      body: radioButtons(
          count: Animal.values.length,
          builder: (itemIndex) {
            return RadioItem(
              text: Animal.values[itemIndex].Title,
              value: Animal.values[itemIndex],
            );
          },
          groupValue: _animal,
          onValuChanged: (Animal? newValue) {
            setState(() {
              _animal = newValue;
            });
          }),
    );
  }
}
