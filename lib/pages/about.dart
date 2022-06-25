import 'package:flutter/material.dart';

void showAbout(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return aboutDialog(context);
    },
  );
}

Widget aboutDialog(BuildContext context) {
  return Dialog(
    backgroundColor: Colors.transparent,
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "About",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(children: const [
                  Padding(
                    // TODO: Complete about text
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "This is a IoT homework.\n\n\n" +
                          "Team: Thalyson Gomes\n" +
                          "Professor: Rafael Gomes",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ], mainAxisAlignment: MainAxisAlignment.start)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: const Text(
                  "OK",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}
