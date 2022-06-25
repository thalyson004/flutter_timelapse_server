import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CameraCard extends StatefulWidget {
  String? ip;
  CameraCard({Key? key, this.ip}) : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  ExtendedNetworkImageProvider image = ExtendedNetworkImageProvider("");
  String text = "";
  //NetworkImage("http://${widget.ip}/capture");

  ExtendedNetworkImageProvider getImage() {
    return ExtendedNetworkImageProvider(
      "http://${widget.ip}/capture?time=${DateTime.now().millisecondsSinceEpoch}",
      scale: 1,
      cache: false,
      cacheMaxAge: Duration(seconds: 1),
      //cancelToken: cancellationToken,
    );
  }

  @override
  void initState() {
    image = getImage();
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      print("Update camera ${widget.ip}");
      final tempImage = getImage();
      setState(() {
        text = DateTime.now().toLocal().toString();
      });
    });

    Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      final tempImage = getImage();
      setState(() {
        image = tempImage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double side = (width / 3) - 3 * 2 * 8;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: side,
            width: side,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.black),
                    Shadow(
                        // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.black),
                    Shadow(
                        // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.black),
                    Shadow(
                        // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.black),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
