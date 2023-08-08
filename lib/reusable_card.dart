import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
