import 'package:flutter/material.dart';

class DatesCard extends StatelessWidget {
  DatesCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        margin: EdgeInsets.all(0),
        alignment: Alignment.centerLeft,
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text('30 Aug. Voting registration closes'),
                  subtitle: Text('10 Sept. Voting closes'),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Register'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      FlatButton(
                        child: const Text('Dismiss'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

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
        alignment: Alignment.centerLeft,
//        alignment: Alignment(0, 0),
        color: Colors.black12,
//      child: Column(
//        children: [
//          Image.network(
//            'https://picsum.photos/200',
//            fit: BoxFit.cover,
//          ),
//          Text(
//            'Aaron Andrews',
//            softWrap: true,
//            style: Theme.of(context).textTheme.title,
//          ),
//        ],
//      ),
        child: Column(children: <Widget>[
          Expanded(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Aaron Andrews',
            softWrap: true,
            style: Theme.of(context).textTheme.title,
          ),
        ]));

    return Scaffold(
        appBar: AppBar(
          title: Text('Legismate'),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ),
        body: Container(
            child: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [DatesCard()],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [districtTitleSection],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
//                  childAspectRatio: 1.0,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              delegate: SliverChildListDelegate(
                [personCard, personCard, personCard],
              ),
            ),
          ),
        ])));
  }
}
