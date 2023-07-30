import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonExit extends StatefulWidget {
  final String buttonTitle;
  const ButtonExit({required this.buttonTitle});

  @override
  State<ButtonExit> createState() => _ButtonExitState();
}

class _ButtonExitState extends State<ButtonExit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: InkWell(
        onTap: () {SystemChannels.platform.invokeMethod('SystemNavigator.pop');},
        splashColor: Theme
            .of(context)
            .primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(248, 193, 204, 240),
                Color.fromARGB(216, 45, 28, 98),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            widget.buttonTitle,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                color: Color.fromARGB(255, 223, 227, 243),
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}