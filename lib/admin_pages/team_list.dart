
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyTeamList extends StatefulWidget {
  const MyTeamList({Key? key}) : super(key: key);

  @override
  State<MyTeamList> createState() => _MyTeamListState();
}

class _MyTeamListState extends State<MyTeamList> {
  final _storage = GetStorage();
  List<dynamic> teams = [];

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  void _loadTeams() {
    var addedteams = _storage.read('teams') ?? [];
    setState(() {
      teams = addedteams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Team List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Team Name: ${teams[index]['team_name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Coach Name: ${teams[index]['coach_name']}'),
                  Text('Owner Name: ${teams[index]['owner_name']}'),
                  Text('Username: ${teams[index]['email']}'),
                  Text('Password: ${teams[index]['password']}'),
        
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
