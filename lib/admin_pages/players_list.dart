import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyPlayersList extends StatefulWidget {
  const MyPlayersList({super.key});

  @override
  State<MyPlayersList> createState() => _MyPlayersListState();
}

class _MyPlayersListState extends State<MyPlayersList> {
  final _storage = GetStorage();
  List<dynamic> players = [];

  @override
  void initState() {
    super.initState();
    _loadPlayers();
  }
  void _loadPlayers() {
    var addedplayers = _storage.read('players') ?? [];
    setState(() {
      players = addedplayers;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Players List'),
      ),
      body:ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Player Name: ${players[index]['playerName']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Role: ${players[index]['role']}'),
                Text('Jersey No.: ${players[index]['jersey']}'),
                Text('Age: ${players[index]['age']}'),
                Text('State: ${players[index]['state']}'),
                Text('Base Price:  ${players[index]['base_price']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}