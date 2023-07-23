import 'package:flutter/material.dart';

class ArchivePage extends StatefulWidget {
  @override
  archivepageState createState() => archivepageState();
}

class archivepageState extends State<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Архив",
        ),
      ),
    );
  }
}
