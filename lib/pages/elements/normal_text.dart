import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String text;

  const NormalText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
            text,
            style: TextStyle(fontFamily: "Montserrat",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 45, 28, 98)),
          ),
    );
  }
}