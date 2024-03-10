import 'package:flutter/material.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 26, color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 158, 179, 235),
    );
  }
}
