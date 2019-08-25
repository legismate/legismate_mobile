import 'package:flutter/material.dart';
import 'package:legismate_mobile/screens/enteraddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Legismate());

class Legismate extends StatelessWidget {

  Future<bool> showAddressPage() async {
    var sharedPreferences = await SharedPreferences.getInstance();
//    sharedPreferences.setString('user', 'hasuser');
    sharedPreferences.clear();
    String user = sharedPreferences.getString('user');
    return user == null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legismate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: showAddressPage(),
        builder: (buildContext, snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data){
              return EnterAddress();
            }

            // Return district page here
            return Container(color: Colors.red);
          } else {
            // Return loading screen while reading preferences
            return Center(child: CircularProgressIndicator());
          }
      },
      ));
  }
}