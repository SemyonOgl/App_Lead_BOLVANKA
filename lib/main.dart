import 'package:app/pages/Archive.dart';
import 'package:app/pages/Tech_support.dart';
import 'package:app/pages/actual_orders.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => SuggestionsPage()),
                    ),
                  );
                },
                splashColor: Theme.of(context).primaryColor,
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
                  child: const Text(
                    'Заказать',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: Color.fromARGB(255, 223, 227, 243),
                        fontWeight: FontWeight.w400),
                  ),
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
                      builder: ((context) => ActualPage()),
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
                    'Актуальное',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: Color.fromARGB(255, 223, 227, 243),
                        fontWeight: FontWeight.w400),
                  ),
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
                      builder: ((context) => ArchivePage()),
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
                    'Архив',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: Color.fromARGB(255, 223, 227, 243),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => TechSuppPage()),
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
                    'Тех.поддержка',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: InkWell(
                onTap: () {
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => OrderPage()),*/
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
                    'Выйти',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: Color.fromARGB(255, 223, 227, 243),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
