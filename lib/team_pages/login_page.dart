import 'package:auctionapp/common/button.dart';
import 'package:auctionapp/team_pages/list_of_players.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class TeamLoginPage extends StatefulWidget {
  const TeamLoginPage({super.key});

  @override
  State<TeamLoginPage> createState() => _TeamLoginPageState();
}

class _TeamLoginPageState extends State<TeamLoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _storage = GetStorage();

  void login() {

    List<dynamic> teams = _storage.read('teams') ?? [];
    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;

    var matchedTeam = teams.firstWhere((team) =>
            team['email'] == enteredEmail &&
            team['password'] == enteredPassword,
        orElse: () => null);

    if (matchedTeam != null) {
     
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListOfPlayers()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("As a Team ", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter the user name provided by the admin'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  labelText: 'Passsword',
                  hintText: 'Enter the Password provided by the admin'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  login();
                },
                child: MainButton(hintText: "Enter"))
          ],
        ),
      ),
    );
  }
}
