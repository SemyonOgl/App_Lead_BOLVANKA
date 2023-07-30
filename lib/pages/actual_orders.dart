import 'package:app/pages/ActOrd_and_DoneOrd/ActOrdPage.dart';
import 'package:app/pages/ActOrd_and_DoneOrd/DoneOrd.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:flutter/material.dart';

class ActualPage extends StatefulWidget {
  @override
  ActualPageState createState() => ActualPageState();
}

class ActualPageState extends State<ActualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Актуальные заказы",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 45, 28, 98)),
            ),
            ButtonMain(buttonTitle: 'Текущие заказы', onPressed: ((context) => ActOrd())),
            ButtonMain(buttonTitle: 'Совершенные заказы', onPressed: ((context) => DonePage())),
          ],
        ),
      ),
    );
  }
}
