import 'package:flutter/material.dart';
import 'players.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'NBA Player List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Player> nbaPlayers = [];

  _MyHomePageState() {
    nbaPlayers.add( new Player(1966,"https://www.espn.com/nba/player/_/id/1966/lebronjames","Lebron James"));
    nbaPlayers.add( new Player(3203,"https://www.espn.com/nba/player/_/id/3202/kevin-durant","Kevin Durant"));
    nbaPlayers.add( new Player(4432816,"https://www.espn.com/nba/player/_/id/4432816/lamelo-ball","Lamelo Ball"));

  }

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.blue,
        child: const Center(child: Text('"Lebron James" 1966')),
      ),
      Image (
        image: NetworkImage("https://www.espn.com/nba/player/_/id/1966/lebronjames"),
      ),
      Container(
        height: 50,
        color: Colors.green,
        child: const Center(child: Text('"Kevin Durant" 3202')),
      ),
      Image (
        image: NetworkImage("https://www.espn.com/nba/player/_/id/3202/kevin-durant"),
      ),
      Container(
        height: 50,
        color: Colors.red,
        child: const Center(child: Text('"Lamelo Ball" 4432816')),
      ),
      Image (
        image: NetworkImage("https://www.espn.com/nba/player/_/id/4432816/lamelo-ball"),
      ),
    ],
  );
}