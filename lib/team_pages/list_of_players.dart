import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ListOfPlayers extends StatefulWidget {
  const ListOfPlayers({super.key});

  @override
  State<ListOfPlayers> createState() => _ListOfPlayersState();
}

class _ListOfPlayersState extends State<ListOfPlayers> {
  final _storage = GetStorage();
  List<dynamic> players = [];
  List<int> skippedIndices = []; 
  void bidbox() {
   
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Bid Amount"),
          content: const TextField(
            decoration: InputDecoration(labelText: 'Enter the bidding Amount'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey.shade500),
                  color: Colors.grey.shade500,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.blue),
                  color: Colors.blue,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void skipBox(int index) {
    setState(() {
      skippedIndices.add(index); 
    });
  }

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

  int wallet = 150000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Players to bid"),
        actions: [
          Text(wallet.toString()),
          SizedBox(
            width: 8,
          ),
          Icon(Icons.wallet),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          bool isSkipped = skippedIndices.contains(index); 
          return Card(
            color: isSkipped ? Colors.grey : Colors.white, 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Player Name: ${players[index]['playerName']}'),
                  Text('Role: ${players[index]['role']}'),
                  Text('Jersey No.: ${players[index]['jersey']}'),
                  Text('Age: ${players[index]['age']}'),
                  Text('State: ${players[index]['state']}'),
                  Text('Base Price: ${players[index]['base_price']}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          bidbox();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSkipped ? Colors.blueGrey : Colors.lightBlueAccent
                              ),
                          child: const Text("BID"),
                        ),
                      ),
                     const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          skipBox(index); 
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: const Text("SKIP", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
