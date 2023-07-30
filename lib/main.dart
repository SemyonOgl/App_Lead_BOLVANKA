import 'package:app/pages/Archive.dart';
import 'package:app/pages/Tech_support.dart';
import 'package:app/pages/actual_orders.dart';
import 'package:app/pages/elements/button_exit.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:app/pages/order_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "navigation",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Меню",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LEADERAPP",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 45, 28, 98)),
            ),
            const SizedBox(height: 55),
            ButtonMain(buttonTitle: 'Заказать', onPressed: ((context) => SuggestionsPage())),
            ButtonMain(buttonTitle: 'Актуальное', onPressed: ((context) => ActualPage())),
            ButtonMain(buttonTitle: 'Архив', onPressed: ((context) => ArchivePage())),
            SizedBox(height: 100,),
            ButtonMain(buttonTitle: 'Тех.поддержка', onPressed: ((context) => TechSuppPage())),
            ButtonExit(buttonTitle: 'Выйти'),
          ],
        ),
      ),
    );
  }
}
