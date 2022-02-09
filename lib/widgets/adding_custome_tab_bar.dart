import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {

  final IconData iconData;
  final double size;

  const TabBarButton({ Key? key, required this.iconData,  this.size = 60.0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(8.0),
      child: Icon(iconData,size: size),
      
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Toggle Buttons'),),
      body: Column(
        children: const [
          CustomeTabBar()
        ],
        
      ),
    );
  }
}

class CustomeTabBar extends StatefulWidget {
  const CustomeTabBar({ Key? key }) : super(key: key);

  @override
  _CustomeTabBarState createState() => _CustomeTabBarState();
}

class _CustomeTabBarState extends State<CustomeTabBar> {

  var _selection = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Align(alignment: FractionalOffset.bottomCenter,
      child: SafeArea(child: ToggleButtons(isSelected: _selection,children: const [
         TabBarButton(iconData: Icons.settings,),
          TabBarButton(iconData: Icons.add,),
          TabBarButton(iconData: Icons.settings_remote,),

      ],
      onPressed: (index){
        setState(() {
          _selection = List.generate(_selection.length,(i) => index == i ?true : false);
        });
      },
      selectedColor: Colors.white,
      fillColor: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
      borderWidth: 4.0,
      borderColor: Colors.blue[400],
      selectedBorderColor: Colors.blue,
      highlightColor: Colors.blue.withOpacity(0.2),
    

      ),),
      )
      
    );
  }
}