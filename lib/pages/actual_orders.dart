import 'package:app/pages/ActOrd_and_DoneOrd/ActOrdPage.dart';
import 'package:app/pages/ActOrd_and_DoneOrd/DoneOrd.dart';
import 'package:app/pages/elements/beautifull_text.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:app/pages/elements/list_of_buttons.dart';
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
            BeautifullTitle(text: 'сделай выбор'),
            Flexible(
              child: ButtonList(buttonsin: [
                ButtonMain(buttonTitle: 'Текущие заказы', onPressed: ((context) => ActOrd())),
                ButtonMain(buttonTitle: 'Совершенные заказы', onPressed: ((context) => DonePage())),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
