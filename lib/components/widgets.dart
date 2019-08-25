import 'package:flutter/material.dart';

//modified from: https://stackoverflow.com/questions/53411890/how-can-i-have-my-appbar-in-a-separate-file-in-flutter-while-still-having-the-wi
class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      title: Text('Legismate'),
    );
  }

  static getBottomNav() {
    //TODO: make nav actually work on click
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

  static getMainHeaders(BuildContext context, String primaryText, String secondaryText) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  primaryText,
                  softWrap: true,
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              Text(
                secondaryText,
                style: Theme.of(context).textTheme.subhead,
              ),
            ],
          ),
        ),
      ]),
    );
  }

}