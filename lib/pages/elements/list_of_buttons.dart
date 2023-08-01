import 'package:app/pages/Archive.dart';
import 'package:app/pages/Tech_support.dart';
import 'package:app/pages/actual_orders.dart';
import 'package:app/pages/elements/button_exit.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:app/pages/order_page.dart';
import 'package:flutter/material.dart';


class ButtonList extends StatefulWidget {

  final List buttonsin;
  ButtonList({required this.buttonsin});

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  List<Widget> _buttonTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _addButtons();
  }

  void _addButtons() {
    // get data from db
    List _buttons = widget.buttonsin;

    Future ft = Future((){});
    for(int i = 0; i<=_buttons.length; i++) {
      ft = ft.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _buttonTiles.add(_buttons[i]);
          _listKey.currentState?.insertItem(_buttonTiles.length - 1);
        });
      });
    };

  }

  final Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));


  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _buttonTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            child: _buttonTiles[index],
            position: animation.drive(_offset),
          );
        }
    );
  }
}