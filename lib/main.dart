import 'package:flutter/material.dart';
import 'package:tipsandtricks/widgets/adding_animated_blurr_image.dart';
import 'package:tipsandtricks/widgets/adding_animated_container.dart';
import 'package:tipsandtricks/widgets/adding_animated_icon.dart';
import 'package:tipsandtricks/widgets/adding_animated_list.dart';
import 'package:tipsandtricks/widgets/adding_animated_widget.dart';
import 'package:tipsandtricks/widgets/adding_aspect_ratio.dart';
import 'package:tipsandtricks/widgets/adding_floating_action_button.dart';
import 'package:tipsandtricks/widgets/adding_jitter_free_screens.dart';
import 'package:tipsandtricks/widgets/adding_position_change.dart';
import 'package:tipsandtricks/widgets/adding_selection_text.dart';
import 'package:tipsandtricks/widgets/adding_shadow_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Adding Shadow Icons To Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlurredImage(),
    );
  }
}



