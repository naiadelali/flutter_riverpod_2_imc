import 'package:flutter/material.dart';

class ButtonCalculate extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const ButtonCalculate({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
