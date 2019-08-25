import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterAddress extends StatefulWidget {
  @override
  _EnterAddressState createState() => _EnterAddressState();
}

class _EnterAddressState extends State<EnterAddress> {
  final addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

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
                          Text('Find Issues That Matter',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25)),
                          Container(
                            margin: const EdgeInsets.only(top: 25.0),
                            child: FlatButton(
                                padding: EdgeInsets.all(20.0),
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
                            width: MediaQuery.of(context).size.width * .8,
                            child: TextField(
                                controller: addressController,
                                decoration: new InputDecoration(
                                labelText: "Your Address",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 25.0),
                            child: FlatButton(
                              onPressed: () {
                                debugPrint(addressController.text);
                              },
                              padding: EdgeInsets.all(15.0),
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                  'Tell me more'
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
