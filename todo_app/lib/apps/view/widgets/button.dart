import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.width});
  final String title;
  final void Function()? onPressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 158, 179, 235))),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ));
  }
}
