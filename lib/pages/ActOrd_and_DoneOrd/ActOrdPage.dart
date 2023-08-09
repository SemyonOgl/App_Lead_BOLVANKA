import 'package:app/main.dart';
import 'package:app/pages/ActOrd_and_DoneOrd/Chat.dart';
import 'package:app/pages/elements/beautifull_text.dart';
import 'package:app/pages/elements/button_active.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:app/pages/elements/normal_text.dart';
import 'package:app/pages/variable/variable_main.dart';
import 'package:flutter/material.dart';

class ActOrd extends StatefulWidget {
  @override
  ActOrdState createState() => ActOrdState();
}

class ActOrdState extends State<ActOrd> {

  String dis = distasnce;

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
              if(prise != '0')Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: NormalText(text: 'У вас новый заказ!'),
              ),
              if(prise != '0')Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: Image.asset("Assets/konsplus.jpg"),
              ),
              if(prise != '0')Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                child: NormalText(text: 'Дистанция для вашего заказа ${distasnce}, приблизительное время доставки ${time}. Цена вашего заказа ${prise}'),
              ),
              if(prise != '0')ButtonActive(buttonTitle: 'Принять заказ', onPressed: ((context) => HomePage())),
              if(prise != '0')SizedBox(height: 15,),
              if(prise != '0')ButtonMain(buttonTitle: 'Связаться с курьером', onPressed: ((context) => ChatPage())),
              if(prise == '0')Center(child: BeautifullTitle(text: 'Пока пусто'),)
            ]
        ),
      ),
    );
  }
}
