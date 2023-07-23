import 'package:app/main.dart';
import 'package:app/pages/Map.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  orderpageState createState() => orderpageState();
}

class orderpageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Заказать доставку",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите адрес отправления',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Введите адрес доставки',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Введите время доставки',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => mappage()),
                  ),
                );
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                  'Продолжить',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      color: Color.fromARGB(255, 223, 227, 243),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
