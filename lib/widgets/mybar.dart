import 'package:flutter/material.dart';

class MyBar extends StatelessWidget implements PreferredSizeWidget {
  const MyBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text("TimeLapse App")),
    );
  }
}
