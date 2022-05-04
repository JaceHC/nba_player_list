import 'package:flutter/material.dart';
import 'package:nba_player_list/playerInformation.dart';
import 'players.dart';
import 'package:http/http.dart' as http;

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
  List<PlayerInformation> myPlayerInformation = [];

  _MyHomePageState() {
    nbaPlayers.add( new Player(1966,"https://www.espn.com/nba/player/_/id/1966/lebronjames","Lebron James"));
    nbaPlayers.add( new Player(3203,"https://www.espn.com/nba/player/_/id/3202/kevin-durant","Kevin Durant"));
    nbaPlayers.add( new Player(4432816,"https://www.espn.com/nba/player/_/id/4432816/lamelo-ball","Lamelo Ball"));

  }


  @override
  void initState(){

    super.initState();
    getPlayerInformation().then((newPlayerInformation){
      myPlayerInformation = newPlayerInformation;
    });
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
        image: NetworkImage("https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/1966.png"),
      ),
      Container(
        height: 50,
        color: Colors.green,
        child: const Center(child: Text('"Kevin Durant" 3202')),
      ),
      Image (
        image: NetworkImage("https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3202.png"),
      ),
      Container(
        height: 50,
        color: Colors.red,
        child: const Center(child: Text('"Lamelo Ball" 4432816')),
      ),
      Image (
        image: NetworkImage("https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4432816.png"),
      ),
    ],
  )
  ;
  Future<List<PlayerInformation>> getPlayerInformation() async{
    Uri url = Uri.parse('https://www.balldontlie.io/api/v1/players');
    final response = http.get(url);
    if (response.statusCode == 200){
      String jsonPlayerInformation = response.body;
      List<PlayerInformation> playerInformation = playerInformationFromJson(jsonPlayerInformation);
      return playerInformation;
    } else{
      print("Json_Services incorrect HTTP response code of ${response.statusCode}");
      return List<PlayerInformation>.empty();
    }
  }
}