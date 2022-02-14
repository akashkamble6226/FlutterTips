import 'package:flutter/material.dart';

class Setting {
  final String title;
  final String subTitle;
  bool isOn;
  Setting({required this.isOn, required this.subTitle, required this.title});
}

extension Flip on Setting {
  void flip() => isOn = !isOn;
}

final settings = [
  Setting(title: 'Setting 1', subTitle: 'sub title 1', isOn: false),
  Setting(title: 'Setting 2', subTitle: 'sub title 2', isOn: true),
  Setting(title: 'Setting 3', subTitle: 'sub title 3', isOn: false),
];

class PlayWithSwitches extends StatefulWidget {
  const PlayWithSwitches({Key? key}) : super(key: key);

  @override
  _PlayWithSwitchesState createState() => _PlayWithSwitchesState();
}

class _PlayWithSwitchesState extends State<PlayWithSwitches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switches In Flutter'),
      ),
      body: ListView(
        children: settings
            .map((e) => SwitchListTile(
                  value: e.isOn,
                  onChanged: (value) {
                    setState(() => e.flip());
                  },
                  title: Text(e.title),
                  subtitle: Text(e.subTitle),
                ))
            .toList(),
      ),
    );
  }
}
