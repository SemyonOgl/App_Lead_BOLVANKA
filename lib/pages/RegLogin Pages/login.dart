import 'package:app/main.dart';
import 'package:app/pages/RegLogin Pages/RegPage.dart';
import 'package:app/pages/elements/beautifull_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Компания Лидер приветствует Вас"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 100,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/

                    child: Image.asset('Assets/konsplus.jpg')),

              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Почта',
                    hintText: 'Пример: abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                    hintText: 'Введите пароль'),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    child: Text(
                      'Войти',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => HomePage()),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 62),
                    child: Text('Нет учетной записи? '),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => RegPag()),
                            ),
                          );
                        },
                        child: Text(
                          'Создайте ее здесь.',
                          style:
                              TextStyle(fontSize: 14, color: Colors.deepPurple),
                        )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
