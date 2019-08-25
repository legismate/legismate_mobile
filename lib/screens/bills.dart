import 'package:flutter/material.dart';
import 'package:legismate_mobile/components/widgets.dart';

class BillsHome extends StatefulWidget {
  @override
  _BillsHomeState createState() => _BillsHomeState();
}

class _BillsHomeState extends State<BillsHome> {

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
                [ReusableWidgets.getMainHeaders(context, "Bills", "keywords")]
              )
            )
          ]
        )
      ),
    );
  }
}