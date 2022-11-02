import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String name;
  final Function() onPressed;
  final Color color;
  const Buttons(
      {Key? key,
      required this.name,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        name,
        style: const TextStyle(fontSize: 15),
      ),
      onPressed: () => onPressed,
    );
  }
}
