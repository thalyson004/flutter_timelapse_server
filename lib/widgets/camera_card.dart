import 'package:flutter/material.dart';

class CameraCard extends StatefulWidget {
  String ip;
  CameraCard({Key? key, required this.ip}) : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: width / 5,
      width: width / 5,
      color: Colors.green,
    );
  }
}
