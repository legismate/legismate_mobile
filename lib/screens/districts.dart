import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DatesCard extends StatelessWidget {
//  DatesCard({Key key}) : super(key: key);

  DatesCard({
    @required this.title,
    @required this.subtitle,
    @required this.action,
  });

  final String title;
  final String subtitle;
  final String action;

  _launchURL(url) async {
//    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                ListTile(
                  title: Text(title),
                  subtitle: Text(subtitle),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Register'),
                        onPressed: () {
                          _launchURL(action);
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

class PersonCard extends StatelessWidget {
  PersonCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      constraints: new BoxConstraints.expand(),
      child: Card(
        child: InkWell(
          splashColor: Colors.black.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Column(children: <Widget>[
            FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text('Aaron Andrews'),
              dense: true,
            ),
          ]),
        ),
      ),
    );
  }
}

//Widget personCard = Container(
//    alignment: Alignment.centerLeft,
//    color: Colors.black12,
//    child: Column(children: <Widget>[
//      Expanded(
//        child: FittedBox(
//          fit: BoxFit.cover,
//          child: Image.network(
//            'https://picsum.photos/200',
//            fit: BoxFit.cover,
//          ),
//        ),
//      ),
//      Text(
//        'Aaron Andrews',
//        softWrap: true,
//        style: Theme.of(context).textTheme.title,
//      ),
//    ]
//    )
//);

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
                  'Your City Council',
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
              [DatesCard(
                title: "30 Aug. Voting Registration Closes",
                subtitle: "10 Sept. Voting begins",
                action: "https://www.kingcounty.gov/depts/elections/how-to-vote/register-to-vote.aspx"
              )],
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
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              delegate: SliverChildListDelegate(
                [PersonCard(), PersonCard(), PersonCard()],
              ),
            ),
          ),
        ])));
  }
}
