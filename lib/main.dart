import 'package:flutter/material.dart';

void main() => runApp(Legismate());

class Legismate extends StatelessWidget {
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Legismate'),
        ),
        body: PeoplePage(),
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
      ),
    );
  }
}

class PeoplePage extends StatelessWidget {
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
          Image.asset(
            'https://picsum.photos/200',
            fit: BoxFit.cover,
          ),
          Text(
            'Aaron Andrews',
            softWrap: true,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );

    return Container(
        child: CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate(
          [districtTitleSection],
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        delegate: SliverChildListDelegate(
          [personCard, personCard, personCard],
        ),
      ),
    ]));
  }
}
