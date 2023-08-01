import 'package:app/pages/elements/beautifull_text.dart';
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
             BeautifullTitle(text:"Всем похуй"),
          ],
        ),
      ),
    );
  }
}
