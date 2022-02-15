import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {

  var _selection = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icons.bedtime,
            label: 'Item 1',
          ),
          BottomNavigationBarItem(
            icon: Icons.bedtime,
            label: 'Item 1',
          )
        ],
        currentIndex: _selection,
        onTap: (value){
          setState(() {
            _selection  = value;
          });
        },

      

        
      ),

      body: Center(child: Text('View ${_selection + 1} is selected',textAlign: TextAlign.center,),),
    );
  }
}
