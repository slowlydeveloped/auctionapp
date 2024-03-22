import 'package:auctionapp/admin_pages/team_list.dart';
import 'package:auctionapp/common/button.dart';


import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

class TeamAdditionPage extends StatefulWidget {
  const TeamAdditionPage({super.key});

  @override
  State<TeamAdditionPage> createState() => _TeamAdditionPageState();
}

class _TeamAdditionPageState extends State<TeamAdditionPage> {
  
  TextEditingController teamNameController = TextEditingController();

  TextEditingController coachNameController = TextEditingController();

  TextEditingController ownerNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

    

 teamdata() {
  final _storage = GetStorage();
  String teamName = teamNameController.text;
  String coachName = coachNameController.text;
  String ownerName = ownerNameController.text;
  String email = emailController.text;
  String password = passwordController.text;

  if (teamName.isEmpty ||
      coachName.isEmpty ||
      ownerName.isEmpty ||
      email.isEmpty ||
      password.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(" Fields are required."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
    return; 
  }

  List<dynamic> teams = _storage.read('teams') ?? [];
  teams.add({
    'team_name': teamName,
    'coach_name': coachName,
    'owner_name': ownerName,
    'email': email,
    'password': password,
  });
  _storage.write('teams', teams);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: teamNameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Team Name'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: coachNameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Coach Name'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ownerNameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Owner Name'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelText: 'User name',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      
                      teamdata();
                      setState(() {});
                      teamNameController.clear();
                      ownerNameController.clear();
                      coachNameController.clear();
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: const MainButton(hintText: 'Add Team')),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MyTeamList()));
                    },
                    child: const MainButton(hintText: 'See Team List'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
