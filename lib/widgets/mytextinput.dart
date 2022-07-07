import 'package:flutter/material.dart';

class MyTextInput extends StatefulWidget {
  TextEditingController controller;
  String hitText;

  MyTextInput({Key? key, required this.controller, required this.hitText})
      : super(key: key);

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) {},
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorText: null,
        errorStyle: const TextStyle(
          fontSize: 16,
          color: Colors.red,
        ),
        filled: true,
        fillColor: const Color(0x45000000),
        disabledBorder: InputBorder.none,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: widget.hitText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.3),
          fontSize: 16,
        ),
      ),
    );
  }
}
