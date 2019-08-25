import 'package:flutter/material.dart';
import 'package:legismate_mobile/services/legismateapi.dart';
import 'package:legismate_mobile/components/widgets.dart';
import 'package:legismate_mobile/models/bill.dart';

class BillsHome extends StatefulWidget {
  @override
  _BillsHomeState createState() => _BillsHomeState();
}

class _BillsHomeState extends State<BillsHome> {
  bool getBillsCall = false;
  List<Bill> upcomingBills = <Bill>[];

  @override
  initState() {
    super.initState();
    //todo: when to get upcoming bills?
    var api = new LegismateApi();
    api.getUpcomingBills().then((result) {
      setState(() {
        getBillsCall = true;
        upcomingBills = result;
      });
    }, onError: (err) {
      //todo: handle error
      print(err);
      debugPrint('could not retrieve bills information');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
      bottomNavigationBar: ReusableWidgets.getBottomNav(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [ ReusableWidgets.getMainHeaders(context, "Bills", "keywords"),
                  Row(
                    children: <Widget>[
                      Text('the keyword section is going to go here')
                    ],
                  )]
              )
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: Text(
                        upcomingBills[index].title,
                      ),
                      subtitle: Text(upcomingBills[index].file),
                    ),
                    childCount: upcomingBills.length,
                ),
            ))
          ]
        )
      ),
    );
  }
}