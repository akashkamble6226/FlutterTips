import 'package:flutter/material.dart';
import 'package:tipsandtricks/widgets/adding_custome_clippers.dart';

const gridImages2 = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3dLJNeD',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/3jRSRCu',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];


class MyCustomeScrollView extends StatelessWidget {
  const MyCustomeScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomeAppBar(),
          CustomGridView(),
          CustomListView(),
        ],
      ),
    );
  }
}

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor:Colors.orange,
      forceElevated: true,
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight:172,
      flexibleSpace: FlexibleSpaceBar(title: Text('Flutter',style: TextStyle(fontSize: 30,color: Colors.white,decoration: TextDecoration.underline),),
      collapseMode: CollapseMode.parallax,
      background: Image.network('https://bit.ly/3x7J5Qt'),
      ),
      
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding:const EdgeInsets.only(bottom: 8.0),
          child: Image.network(gridImages2[index]),
        );
      }, childCount: gridImages2.length)),
    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0),
        delegate: SliverChildBuilderDelegate((context, index) {
          return SizedBox(
            width: 100,
            height: 100,
            child: Image.network(gridImages2[index]),
          );

          
        },
        childCount: gridImages2.length,
        ),
        
      ),
    );
  }
}
