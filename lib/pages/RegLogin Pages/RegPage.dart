import 'package:app/pages/RegLogin Pages/ClientAccReg.dart';
import 'package:app/pages/RegLogin Pages/EmployeeAccReg.dart';
import 'package:flutter/material.dart';
import 'package:app/main.dart';


class RegPag extends StatefulWidget {
  @override
  _RegPagState createState() => _RegPagState();
}

class _RegPagState extends State<RegPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Выберите роль"),
        ),
        body: Container(
          alignment: Alignment.center, //Прилипает к AppBar, исправить

          child: PageView(

            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Column(children: <Widget>[
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => EmployeeAccReg()),
                        ),
                      );
                    }, // Handle your callback.
                    splashColor:
                        Color.fromARGB(255, 44, 13, 94).withOpacity(0.5),
                    child: Ink(
                      height: 400,
                      width: 400,
                      decoration: const BoxDecoration(
                        image: DecorationImage(


                          image: AssetImage('assets/neruss.jpg'),

                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.purple,
                      fontFamily: "Montserrat",
                      fontSize: 40),
                  child: Text(
                    'Я уже ящер',
                  ),
                ),
              ]),
              Column(
                children: <Widget>[
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ClientAccReg()),
                          ),
                        );
                      }, // Handle your callback.
                      splashColor:
                          Color.fromARGB(255, 44, 13, 94).withOpacity(0.5),
                      child: Ink(
                        height: 400,
                        width: 400,
                        decoration: const BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage('assets/russ.jpg'),

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.purple,
                        fontFamily: "Montserrat",
                        fontSize: 40),
                    child: Text(
                      'Я еще рус',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
