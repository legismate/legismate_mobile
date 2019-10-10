import 'package:flutter/material.dart';
import 'package:legismate_mobile/screens/districts.dart';
import 'package:legismate_mobile/screens/bills.dart';

//all destination related things edited from: https://medium.com/flutter/getting-to-the-bottom-of-navigation-in-flutter-b3e440b9386
class Destination {
  const Destination(this.title, this.icon, this.widget);
  final String title;
  final IconData icon;
  final Widget widget;
}

//bottom nav destinations go here
final List<Destination> allDestinations = <Destination>[
  Destination('People', Icons.people, Districts()),
  Destination('Bills', Icons.view_list, BillsHome()),
];


class DestinationWrapper extends StatefulWidget {
  @override
  _DestinationWrapperState createState() => _DestinationWrapperState();
}

class _DestinationWrapperState extends State<DestinationWrapper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return destination.widget;
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              title: Text(destination.title)
          );
        }).toList(),
      ),
    );
  }
}