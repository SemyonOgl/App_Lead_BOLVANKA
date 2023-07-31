import 'package:flutter/material.dart';

class BeautifullTitle extends StatelessWidget {
  final String text;

  const BeautifullTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: Text(
          text,
          style: TextStyle(fontFamily: "Montserrat",
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 45, 28, 98)),
        ),
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 2000),
        builder: (BuildContext context, double _val, Widget? child) {
          return Opacity(
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(top: _val = 20),
              child: child,
            ),
          );
        }
    );
  }
}