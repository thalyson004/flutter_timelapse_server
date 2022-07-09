import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  static String _serverIp = "";

  static set serverIp(String ip) {
    _serverIp = ip;
  }

  static ImageProvider getImage(String ip) {
    return NetworkImage("http://$ip/capture");
  }

  static Future<bool> serverUp(String ip) async {
    final dio = Dio();
    try {
      Response<dynamic> response = await dio.get(ip);
      print(response);
    } catch (e) {
      print("Error");
      return false;
    }

    return true;
  }

  static Future<Response> getJobs() async {
    late Response response;

    final dio = Dio();
    try {
      response = await dio.get("$_serverIp/job/list");
    } catch (e) {
      print("Error");
      rethrow;
    }

    return response;
  }

  static Future<void> addJob(String ip, String interval) async {
    final dio = Dio();
    await dio.get("$_serverIp/job/add/$ip/$interval");
  }

  static Future<void> removeJob(String ip) async {
    final dio = Dio();
    await dio.get("$_serverIp/job/remove/$ip");
  }
}
