import 'package:app/pages/ActOrd_and_DoneOrd/Chat.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:flutter/material.dart';

class ActOrd extends StatefulWidget {
  @override
  ActOrdState createState() => ActOrdState();
}

class ActOrdState extends State<ActOrd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Текущие заказы",
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
                    fontSize: 0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 45, 28, 98)),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: Text(
                  "Заказ №1488",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 45, 28, 98)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: Image.asset("Assets/konsplus.jpg"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: Text(
                  "Ваш курьер будет через 10 минут!",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 45, 28, 98)),
                ),
              ),
              ButtonMain(buttonTitle: 'Связаться с курьером', onPressed: ((context) => ChatPage())),
            ]
        ),
      ),
    );
  }
}
