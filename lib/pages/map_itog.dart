import 'dart:async';
import 'package:app/main.dart';
import 'package:app/pages/elements/button_main.dart';
import 'package:app/pages/elements/normal_text.dart';
import 'package:app/pages/sql_database/main_database.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SessionPage extends StatefulWidget {
  final Future<DrivingSessionResult> result;
  final List<MapObject> mapObjects;
  final Point point;
  final double zoom;

  SessionPage(this.mapObjects, this.result, this.point, this.zoom);

  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<SessionPage> {

  final mapControllerCompleter = Completer<YandexMapController>();

  late List<MapObject> mapObjects = widget.mapObjects;

  List<DrivingSessionResult> results = [];

  @override
  void initState() {
    super.initState();
    _init();
    _moveToCurrentLocation();
  }

  Future<void> _moveToCurrentLocation(
      ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
          CameraPosition(
            target: widget.point,
            zoom: widget.zoom,
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Маршрут доставки')),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        YandexMap(
                          mapObjects: mapObjects,
                          onMapCreated: (controller) {
                            mapControllerCompleter.complete(controller);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: _getList(),
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonMain(buttonTitle: 'Вернуться на главный экран', onPressed: ((context) => HomePage())),
                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }

  List<Widget> _getList() {
    final list = <Widget>[];

    if (results.isEmpty) {
      list.add((const NormalText(text: 'Ничего не найдено')));
    }

    for (var r in results) {
      list.add(Container(height: 20));

      list.add(NormalText(text:'Время поездки: ${r.routes![0].metadata.weight.timeWithTraffic.text}'));

      list.add(NormalText(text:'Дистанция: ${r.routes![0].metadata.weight.distance.text}'));

      NormalText(text:'Цена: 1000 рублей');

      list.add(Container(height: 20));
    }

    return list;
  }

  Future<void> _init() async {
    await _handleResult(await widget.result);
  }

  Future<void> _handleResult(DrivingSessionResult result) async {

    if (result.error != null) {
      print('Error: ${result.error}');
      return;
    }

    setState(() { results.add(result); });
    setState(() async {
      mapObjects.add(PolylineMapObject(
        mapId: MapObjectId('route_polyline'),
        polyline: Polyline(points: result.routes![0].geometry),
        strokeColor: Colors.red,
        strokeWidth: 2,
      ));
      await DBProvider.db.newOrder(
          results[0].routes![0].metadata.weight.distance.text,
          results[0].routes![0].metadata.weight.timeWithTraffic.text,
          '1000 рублей'
      );
    });
  }
}
