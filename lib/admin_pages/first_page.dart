import 'package:auctionapp/admin_pages/player_addition.dart';
import 'package:auctionapp/admin_pages/team_addition.dart';
import 'package:auctionapp/common/button.dart';
import 'package:auctionapp/team_pages/login_page.dart';
import 'package:flutter/material.dart';

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamAdditionPage()));
              },
              child: MainButton(hintText: 'Add a Team')),
          const SizedBox(height: 40),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayerAdditionPage()));
              },
              child: MainButton(hintText: 'Add a Player')),
                 const SizedBox(height: 40),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeamLoginPage()));
              },
              child: MainButton(hintText: 'As a team'))
        ],
      ),
    ));
  }
}
