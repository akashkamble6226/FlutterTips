import 'package:flutter/material.dart';

const imageUrls = [
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

Stream<String> images() => Stream.periodic(
      const Duration(seconds: 1),
      (index) => index % imageUrls.length,
    ).map((index) => imageUrls[index]);

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({Key? key}) : super(key: key);

  @override
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<String> imageUrls = [];

  void populatedList() async {
    await for (final url in images()) {
      imageUrls.insert(0, url);
      _key.currentState?.insertItem(
        0,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    populatedList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: AnimatedList(
          key: _key,
          initialItemCount: imageUrls.length,
          itemBuilder: (context, index, animation) {
            final imageUrl = imageUrls[index];
            return SizeTransition(
              sizeFactor: animation.drive(
                CurveTween(curve: Curves.elasticInOut),
              ),

              child: Column(children: [
                Card(child: Image.network(imageUrl),),
                const SizedBox(height:10),
              ],),
            );
            
          },
        ),
      ),
    );
  }
}
