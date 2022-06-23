import 'package:flutter/material.dart';

class API {
  static ImageProvider getImage(String ip) {
    return NetworkImage("http://$ip/capture");
  }
}
