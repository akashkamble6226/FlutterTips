//this widget wont allow to enter any word from below list in the text form field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const blockedWords = {'foo', 'bar', 'baz'};

extension Contains on List<String> {
  bool containsAny(Set<String> values) =>
      {...this}.lowered.intersection(values.lowered).isNotEmpty;
}

extension Lower on Set<String> {
  Set<String> get lowered => {...map((e) => e.toLowerCase())};
}

class CensorText extends StatelessWidget {
  const CensorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextField(
          inputFormatters: [
            // old value means whatever you have writeen till that point 
            TextInputFormatter.withFunction((oldValue, newValue) {
              final words = newValue.text.split(' ');
              if (words.containsAny(blockedWords)) {
                return oldValue;
              } else {
                return newValue;
              }
            })
          ],
        ),
      ),
    );
  }
}
