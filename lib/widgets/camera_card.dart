import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraCard extends StatefulWidget {
  String? ip;
  CameraCard({Key? key, this.ip}) : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  @override
  void initState() {
    //final st = StreamBuilder();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: width / 3 - 20,
      width: width / 3 - 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: widget.ip != null
              ? NetworkImage("http://${widget.ip}/capture")
              : const NetworkImage(
                  "https://i.ytimg.com/vi/w6geNk3QnBQ/maxresdefault.jpg"),
        ),
      ),
    );
  }
}
