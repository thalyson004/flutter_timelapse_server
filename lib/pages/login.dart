import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/api.dart';
import '../db/db.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static String route = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
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
                hintText: "Ip Address",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "ENTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    bool up = await API.serverUp(controller.text);
                    print("Server up: $up");
                    if (up) {
                      API.serverIp = controller.text;
                      Navigator.pushReplacementNamed(context, Home.route);
                    } else {
                      showError(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

void showError(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("Connection error"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK")),
        ],
      );
    },
  );
}
