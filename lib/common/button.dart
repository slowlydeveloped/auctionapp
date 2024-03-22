import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  final String hintText;
  const MainButton({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
       Color.fromRGBO(187, 63, 221, 1),
        Color.fromRGBO(251, 109, 169, 1)
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight),
        borderRadius: BorderRadius.circular(20)
      ),
        child: Text(hintText, style: TextStyle(fontSize: 22, color: Colors.white),),
      
    );
  }
}