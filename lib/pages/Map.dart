import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class BringCoord extends StatefulWidget {

  double longit;

  double latit;

  double longittwo;

  double latittwo;

  List<MapObject> mapObjects;

  BringCoord(this.longit, this.latit, this.longittwo, this.latittwo)
      : mapObjects = [PlacemarkMapObject(
    mapId: const MapObjectId('start_placemark'),
    point: Point(latitude: latit, longitude: longit),
    icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage('assets/pngmapicons.png'), scale: 0.1)),
  ),
    PlacemarkMapObject(
      mapId: const MapObjectId('end_placemark'),
      point: Point(latitude: latittwo, longitude: longittwo),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage('assets/pngmapicons.png'), scale: 0.1)),
    ),
  ];

  @override
  State<BringCoord> createState() => _Bring_coordState();
}


class _Bring_coordState extends State<BringCoord> {

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: YandexMap(
                  mapObjects: widget.mapObjects
              )
          ),
          const SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: _requestRoutes,
                          child: Text('Build route'),
                        ),
                      ]
                  )
              )
          )
        ]
    );
  }

  Future<void> _requestRoutes() async {

    var resultWithSession = YandexDriving.requestRoutes(
        points: [
          RequestPoint(point: Point(latitude: widget.latit, longitude: widget.longit), requestPointType: RequestPointType.wayPoint),
          RequestPoint(point: Point(latitude: widget.latittwo, longitude: widget.longittwo), requestPointType: RequestPointType.wayPoint),
        ],
        drivingOptions: const DrivingOptions(
            initialAzimuth: 0,
            routesCount: 5,
            avoidTolls: true
        )
    );

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => _SessionPage(
                widget.mapObjects,
                resultWithSession.result
            )
        )
    );
  }

}

class _SessionPage extends StatefulWidget {
  final Future<DrivingSessionResult> result;
  final List<MapObject> mapObjects;

  _SessionPage(this.mapObjects, this.result);

  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<_SessionPage> {

  late List<MapObject> mapObjects = widget.mapObjects;

  List<DrivingSessionResult> results = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Driving')),
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
                            mapObjects: mapObjects
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
                                Column(
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () async {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => HomePage()),
                                                  );
                                                },
                                                child: Text('Вернуться на главный экран')
                                            )
                                          ],
                                        )
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
      list.add((const Text('Nothing found')));
    }

    for (var r in results) {
      list.add(Container(height: 20));

      list.add(Text('Время поездки: ${r.routes![0].metadata.weight.timeWithTraffic.text}'));

      list.add(Text('Дистанция: ${r.routes![0].metadata.weight.distance.text}'));

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
    setState(() {
      mapObjects.add(PolylineMapObject(
        mapId: MapObjectId('route_polyline'),
        polyline: Polyline(points: result.routes![0].geometry),
        strokeColor: Colors.red,
        strokeWidth: 2,
      ));
    });
  }
}

//Кнопка вернуться, разобраться
//Карту привязать