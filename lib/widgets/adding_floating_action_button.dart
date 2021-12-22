import 'package:flutter/material.dart';

const List<FloatingActionButtonLocation> locations = [
  FloatingActionButtonLocation.centerDocked,
  FloatingActionButtonLocation.startDocked,
  FloatingActionButtonLocation.startFloat,
  FloatingActionButtonLocation.centerFloat,
  FloatingActionButtonLocation.endFloat,
];

extension GoAround<T> on List<T> 
{
  T elementByGoingAround(int index) {
    final finalIndex = index >= length ? index.remainder(length) : index;
    return this[finalIndex];
  }
}

class FloatingActButton extends StatefulWidget {
  const FloatingActButton({Key? key}) : super(key: key);

  @override
  _FloatingActButtonState createState() => _FloatingActButtonState();
}

class _FloatingActButtonState extends State<FloatingActButton> {
  var _locationIndex = 0;
  FloatingActionButtonLocation get location =>
      locations.elementByGoingAround(_locationIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLoating Action Button'),
      ),
      floatingActionButtonLocation: location,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _locationIndex += 1);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow[200],
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              label:'GO TO BED' ,
              icon: Icon(
                Icons.bedtime,
                semanticLabel: 'Item 1',
              ),
            ),
            BottomNavigationBarItem(
              label:'CHECK ALARM' ,
              icon: Icon(
                Icons.access_alarm,
               semanticLabel: 'Item 2'),
            )
          ],
          currentIndex: 0,
          ),
    );
  }
}
