import 'package:flutter/material.dart';

class TechSuppPage extends StatefulWidget {
  @override
  TechSuppPageState createState() => TechSuppPageState();
}

class TechSuppPageState extends State<TechSuppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Всем похуй",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Всем похуй",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 45, 28, 98)),
            ),
          ],
        ),
      ),
    );
  }
}
