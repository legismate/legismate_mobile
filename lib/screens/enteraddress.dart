import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:legismate_mobile/services/legismateapi.dart';
import 'package:legismate_mobile/models/district.dart';
import 'dart:convert';

class EnterAddress extends StatefulWidget {
  @override
  _EnterAddressState createState() => _EnterAddressState();
}

class _EnterAddressState extends State<EnterAddress> {
  final addressController = TextEditingController();
  //TODO: use to display progress for the user
  bool districtApiCall = false; //indicates whether or not we've made the district api call

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void _callDistrictApi(String location, BuildContext context) {
    debugPrint('inside of call district API');
    District testDistrict = District(name: 'District 3');
    _storeDistrictData(testDistrict);
    Navigator
        .of(context)
        .pushNamedAndRemoveUntil('/Districts', (Route<dynamic> route) => false);

    //TODO: hook this up to the district call once it works
//    var api = new LegismateApi();
//    api.getDistricts(location).then((district) {
//        _storeDistrictData(district);
//        //TODO: navigate to another page
//      }, onError: (error) {
//        debugPrint('could not retrieve district information');
//    });
  }

  void _storeDistrictData(District d) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('hasData', true);
    sharedPreferences.setString('district', jsonEncode(d));
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
                          Text('Tell me shit that matters',
                          style: Theme.of(context).textTheme.headline),
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
                                  debugPrint('current location btn is for later googlez');
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
                                  labelStyle: TextStyle(color: Colors.blue),
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 25.0),
                            child: FlatButton(
                              onPressed: () {
                                debugPrint(addressController.text);
                                setState(() {
                                  districtApiCall = true;
                                });
                                //TODO: validate, make sure that address is populated
                                _callDistrictApi(addressController.text, context);
                              },
                              padding: EdgeInsets.all(15.0),
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                  'enlighten me!'
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
