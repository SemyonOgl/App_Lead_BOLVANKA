import 'package:app/main.dart';
import 'package:app/pages/ActOrd_and_DoneOrd/Chat.dart';
import 'package:app/pages/elements/beautifull_text.dart';
import 'package:app/pages/elements/button_active.dart';
import 'package:app/pages/elements/button_delete.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:app/pages/elements/normal_text.dart';
import 'package:app/pages/models/Order.dart';
import 'package:app/pages/sql_database/main_database.dart';
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
        title: const Text("Текущие заказы"),
      ),
      body: FutureBuilder<Order>(
        future: DBProvider.db.getLastOrder(),
        builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
          if (snapshot.data?.active == 1) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                      child: NormalText(text: 'У вас новый заказ!'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                      child: Image.asset("Assets/konsplus.jpg"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                      child: NormalText(text: 'Дистанция для вашего заказа ${snapshot.data?.distance}, приблизительное время доставки ${snapshot.data?.time}. Цена вашего заказа ${snapshot.data?.prise}'),
                    ),
                    ButtonActive(buttonTitle: 'Принять заказ', onPressed: ((context) => HomePage())),
                    ButtonDelete(buttonTitle: 'Отказаться от заказа', onPressed: ((context) => HomePage())),
                    SizedBox(height: 15,),
                    ButtonMain(buttonTitle: 'Связаться с курьером', onPressed: ((context) => ChatPage())),
                  ]
                )
              );
          } else {
            return Center(child: BeautifullTitle(text: 'Пока пусто'));
          }
        },
      ),
    );
  }
}
