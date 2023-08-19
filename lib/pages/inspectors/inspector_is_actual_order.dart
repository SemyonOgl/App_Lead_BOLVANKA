import 'package:app/pages/ActOrd_and_DoneOrd/ActOrdPage.dart';
import 'package:app/pages/models/Order.dart';
import 'package:app/pages/order_page.dart';
import 'package:app/pages/sql_database/main_database.dart';
import 'package:flutter/material.dart';

class IsActualOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Order>(
        future: DBProvider.db.getLastOrder(),
        builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
          if (snapshot.data?.active == 1) {
            return ActOrd();
          } else {
            return SuggestionsPage();
          }
        },
      ),
    );
  }
}