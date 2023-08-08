import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardChild extends StatelessWidget {
  CardChild({required this.icon, required this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 206, 205, 205)),
        )
      ],
    );
  }
}
