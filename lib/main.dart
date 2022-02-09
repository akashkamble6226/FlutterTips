import 'package:flutter/material.dart';
import 'package:tipsandtricks/widgets/adding_animated_blurr_image.dart';
import 'package:tipsandtricks/widgets/adding_animated_container.dart';
import 'package:tipsandtricks/widgets/adding_animated_icon.dart';
import 'package:tipsandtricks/widgets/adding_animated_list.dart';
import 'package:tipsandtricks/widgets/adding_animated_widget.dart';
import 'package:tipsandtricks/widgets/adding_aspect_ratio.dart';
import 'package:tipsandtricks/widgets/adding_blurred_tabbar.dart';
import 'package:tipsandtricks/widgets/adding_card_widget.dart';
import 'package:tipsandtricks/widgets/adding_check_box_list_tile.dart';
import 'package:tipsandtricks/widgets/adding_color_filter.dart';
import 'package:tipsandtricks/widgets/adding_containers_as_clip_oval.dart';
import 'package:tipsandtricks/widgets/adding_converting_enum_to_radio_button.dart';
import 'package:tipsandtricks/widgets/adding_custome_color_component.dart';
import 'package:tipsandtricks/widgets/adding_custome_tab_bar.dart';
import 'package:tipsandtricks/widgets/adding_floating_action_button.dart';
import 'package:tipsandtricks/widgets/adding_jitter_free_screens.dart';
import 'package:tipsandtricks/widgets/adding_position_change.dart';
import 'package:tipsandtricks/widgets/adding_progress_bar_with_num.dart';
import 'package:tipsandtricks/widgets/adding_selection_text.dart';
import 'package:tipsandtricks/widgets/adding_shadow_icon.dart';
import 'package:tipsandtricks/widgets/censoring_textfield.dart';

import 'widgets/adding_custome_clippers.dart';

import 'widgets/adding_custome_text_button.dart';


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
      home:  const HomeScreen(),
    );
  }
}
