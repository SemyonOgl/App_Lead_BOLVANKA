import 'package:app/pages/elements/beautifull_text.dart';
import 'package:app/pages/models/Order.dart';
import 'package:app/pages/sql_database/main_database.dart';
import 'package:flutter/material.dart';

class DonePage extends StatefulWidget {
  @override
  DonePageState createState() => DonePageState();
}

class DonePageState extends State<DonePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Совершенные заказы"),
      ),
      body: FutureBuilder<List<Order>>(
        future: DBProvider.db.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Order item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.purple),
                  child: ListTile(
                    title: Text('Заказ на дистанцию ${item.distance.toString()} по цене ${item.prise.toString()}'),
                    leading: Text(item.id.toString())
                  ),
                );
              },
            );
          } else {
            return Center(child: BeautifullTitle(text: 'Возникла ошибка с базами данных'));
          }
        },
      ),
    );
  }
}
