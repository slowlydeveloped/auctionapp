import 'package:auctionapp/admin_pages/players_list.dart';
import 'package:auctionapp/common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class PlayerAdditionPage extends StatefulWidget {
  PlayerAdditionPage({super.key});

  @override
  State<PlayerAdditionPage> createState() => _PlayerAdditionPageState();
}

class _PlayerAdditionPageState extends State<PlayerAdditionPage> {
  TextEditingController playerNameController = TextEditingController();

  TextEditingController roleController = TextEditingController();

  TextEditingController jerseyController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController basePriceController = TextEditingController();

  

  void playerdata() {
    final _storage = GetStorage();
    List<dynamic> players = _storage.read('players') ?? [];
    players.add({
      'playerName': playerNameController.text,
      'role': roleController.text,
      'jersey': jerseyController.text,
      'age': ageController.text,
      'state': stateController.text,
      'base_price': int.tryParse(basePriceController.text)?? 0,
      //  'isSkip' : false,
    });
    _storage.write('players', players);
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Player Name'),
                  controller: playerNameController,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Role'),
                  controller: roleController,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: jerseyController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Jersey No.'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Age'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: stateController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'State'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: basePriceController ,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Base Price'),
                ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      setState(() {});
                      playerdata();
                      playerNameController.clear();
                      roleController.clear();
                      jerseyController.clear();
                      ageController.clear();
                      stateController.clear();
                      basePriceController.clear();
                    },
                    child: MainButton(hintText: 'Add Player')),
                    SizedBox(height: 20),
                    GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPlayersList()));
                  },
                  child: MainButton(hintText: 'See Players List'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}