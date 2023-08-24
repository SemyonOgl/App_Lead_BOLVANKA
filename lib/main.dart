import 'package:app/pages/Archive.dart';
import 'package:app/pages/Tech_support.dart';
import 'package:app/pages/actual_orders.dart';
import 'package:app/pages/elements/beautifull_text.dart';
import 'package:app/pages/elements/button_exit.dart';
import 'package:app/pages/elements/list_of_buttons.dart';
import 'package:app/pages/inspectors/inspector_api_download.dart';
import 'package:app/pages/inspectors/inspector_is_actual_order.dart';
import 'package:flutter/material.dart';

import 'pages/elements/button_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "navigation",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ApiDownload(),
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
        title: const Text("Меню"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BeautifullTitle(text: 'ПРИЛОЖЕНИЕ "ЛИДЕР"',),
            const SizedBox(height: 55),
            Flexible(
              child: ButtonList(buttonsin: [
                  ButtonMain(buttonTitle: 'Заказать', onPressed: ((context) => IsActualOrder())),
                  ButtonMain(buttonTitle: 'Актуальное', onPressed: ((context) => ActualPage())),
                  ButtonMain(buttonTitle: 'Архив', onPressed: ((context) => ArchivePage())),
                  SizedBox(height: 100,),
                  ButtonMain(buttonTitle: 'Тех.поддержка', onPressed: ((context) => TechSuppPage())),
                  ButtonExit(buttonTitle: 'Выйти'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
