import 'package:flutter/material.dart';

class DonePage extends StatefulWidget {
  @override
  DonePageState createState() => DonePageState();
}

class DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Совершенные заказы",
        ),
      ),
    );
  }
}
