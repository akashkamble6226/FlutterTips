// import 'dart:ui';

// import 'package:flutter/material.dart';

// class BlurredTabBar extends StatelessWidget {
//   const BlurredTabBar({Key? key, required this.buttons}) : super(key: key);

//   final List<IconButton> buttons;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//         body: Align(
//       alignment: Alignment.bottomCenter,
//       child: ClipRRect(
//         child: Container(
//           height: 80,
//           color: Colors.white.withOpacity(0.4),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.5),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 15),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: buttons,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tipsandtricks/Tips/adding_median_extension.dart';

const images = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

class CustomTabBar extends StatelessWidget {
  final List<IconButton> buttons;

  const CustomTabBar({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRect(
        child: Container(
          height: 80,
          color: Colors.white.withOpacity(0.4),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: buttons,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const summerIcon = Icon(
  Icons.surfing,
  size: 40.0,
  color: Colors.teal,
);

const autumnIcon = Icon(
  Icons.nature_outlined,
  size: 40.0,
  color: Colors.black45,
);

const winterIcon = Icon(
  Icons.snowboarding,
  size: 40.0,
  color: Colors.black45,
);

class BlurredTabBar extends StatelessWidget {
  const BlurredTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blurred Tab Bar'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              final url = images[index];
              return Image.network(url);
            },
          ),
          CustomTabBar(
            buttons: [
              IconButton(
                icon: summerIcon,
                onPressed: () {
                  // implement me
                  testIt();
                },
              ),
              IconButton(
                icon: autumnIcon,
                onPressed: () {
                  // implement me
                },
              ),
              IconButton(
                icon: winterIcon,
                onPressed: () {
                  // implement me
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
