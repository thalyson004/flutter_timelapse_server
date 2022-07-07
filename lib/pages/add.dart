import 'package:flutter/material.dart';
import 'package:flutter_timelapse/widgets/mytextinput.dart';
import 'package:provider/provider.dart';

import '../db/db.dart';

void showAdd(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return addDialog(context);
    },
  );
}

Widget addDialog(BuildContext context) {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController internvalController = TextEditingController();

  return Dialog(
    backgroundColor: Colors.transparent,
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
        minHeight: MediaQuery.of(context).size.height * 0.1,
        minWidth: MediaQuery.of(context).size.width * 0.1,
        maxWidth: MediaQuery.of(context).size.width * 0.4,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: const [
                        Text(
                          "Add camera",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        MyTextInput(
                          controller: ipController,
                          hitText: "Ip Address",
                        ),
                        const Divider(
                          height: 20,
                        ),
                        MyTextInput(
                          controller: ipController,
                          hitText: "Interval",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "ADD",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {
                        Provider.of<DB>(context, listen: false).addCamera(
                            ipController.text, internvalController.text);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
