import 'package:flutter/material.dart';
import 'package:legismate_mobile/components/widgets.dart';

class Districts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget districtTitleSection = Container(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Seattle City Council',
                  softWrap: true,
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              Text(
                'District 6',
                style: Theme.of(context).textTheme.subhead,
              ),
            ],
          ),
        ),
      ]),
    );

    Widget personCard = Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      color: Colors.black12,
      child: Column(
        children: [
//          Image.asset(
//            'https://picsum.photos/200',
//            fit: BoxFit.cover,
//          ),
          Text(
            'Aaron Andrews',
            softWrap: true,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
      bottomNavigationBar: ReusableWidgets.getBottomNav(),
      body: Container(
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [districtTitleSection],
              ),
            ),
            new SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                delegate: SliverChildListDelegate(
                  [personCard, personCard, personCard],
                ),
              ),
            ),
          ]))
    );


  }
}