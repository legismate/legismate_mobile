import 'package:flutter/material.dart';


//modified from: https://stackoverflow.com/questions/53411890/how-can-i-have-my-appbar-in-a-separate-file-in-flutter-while-still-having-the-wi
class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      title: Text('Legismate'),
    );
  }

  static getBottomNav() {
    return BottomNavigationBar(
//          onTap: (newIndex) => setState(() => _index = newIndex),
//          currentIndex: _index,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.people),
          title: new Text("People"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.view_list),
          title: new Text("Bills"),
        ),
      ],
    );
  }
}