import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterAddress extends StatefulWidget {
  @override
  _EnterAddressState createState() => _EnterAddressState();
}

class _EnterAddressState extends State<EnterAddress> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Find Issues That Matter'),
                          FlatButton(
                              padding: EdgeInsets.all(40.0),
                              color: Colors.blue,
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.my_location),
                                  Text('Use Location'),
                                ],
                              ),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              onPressed: () {
                                debugPrint('hi marianne');
                              }
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Divider(),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            child: TextField(
                              decoration: new InputDecoration(
                                labelText: "Enter Your Address",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: FlatButton(
                              onPressed: () {
                                debugPrint('Find my rep!');
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                  'Find My Rep'
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}
