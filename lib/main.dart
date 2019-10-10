import 'package:flutter/material.dart';
import 'package:legismate_mobile/components/destination.dart';
import 'package:legismate_mobile/screens/enteraddress.dart';
import 'package:legismate_mobile/screens/bills.dart';
import 'package:legismate_mobile/screens/districts.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() => runApp(Legismate());

class Legismate extends StatelessWidget {

  Future<bool> _checkForData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('hasData') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legismate',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.black,
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            headline: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            title: TextStyle(fontSize: 20),
            subhead: TextStyle(fontSize: 18),
            body1: TextStyle(fontSize: 16),
            body2: TextStyle(fontSize: 14)),
      ),
      home: FutureBuilder<bool>(
        future: _checkForData(),
        builder: (buildContext, snapshot) {
          debugPrint('inside of home builder!');
          if(snapshot.hasData) {
            debugPrint('we apparently have data');
            if(!snapshot.data){
              debugPrint('data is false');
              return EnterAddress();
            } else {
              return DestinationWrapper();
            }

          } else {
            // Return loading screen while reading preferences
            return Center(child: CircularProgressIndicator());
          }
      },
    ),
    routes: <String, WidgetBuilder>{
        '/EnterAddress': (context) => EnterAddress(),
        '/Bills': (context) => BillsHome(),
        '/Districts': (context) => Districts(),
    });
  }
}