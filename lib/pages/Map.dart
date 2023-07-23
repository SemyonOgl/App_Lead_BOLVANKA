//Пока так, скорее всего потом страница уничтожится

import 'package:app/main.dart';
import 'package:flutter/material.dart';

class mappage extends StatefulWidget {
  @override
  mappageState createState() => mappageState();
}

class mappageState extends State<mappage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Карта",
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: Image.asset("Assets/konsplus.jpg"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => HomePage()),
                      ),
                    );
                  },
                  splashColor: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
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
                    child: const Text(
                      'Вернуться',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          color: Color.fromARGB(255, 223, 227, 243),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

//Кнопка вернуться, разобраться
//Карту привязать