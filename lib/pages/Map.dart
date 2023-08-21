import 'dart:async';
import 'dart:math';
import 'package:app/pages/elements/normal_text.dart';
import 'package:app/pages/map_itog.dart';
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
    icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage('Assets/pngmapicons.png'), scale: 0.1)),
  ),
    PlacemarkMapObject(
      mapId: const MapObjectId('end_placemark'),
      point: Point(latitude: latittwo, longitude: longittwo),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage('Assets/pngmapicons.png'), scale: 0.1)),
    ),
  ];

  @override
  State<BringCoord> createState() => _Bring_coordState();
}


class _Bring_coordState extends State<BringCoord> {

  final mapControllerCompleter = Completer<YandexMapController>();

  late double zoom = log(sqrt(360*360+180*180)/sqrt((
      (widget.latit-widget.latittwo).abs()*(widget.latit-widget.latittwo).abs())
      +(
          (widget.longit-widget.longittwo).abs()*(widget.longit-widget.longittwo).abs())
  ),
  )/log(2);

  late Point point = Point(
    latitude: (widget.latit+widget.latittwo)/2,
    longitude: (widget.longit+widget.longittwo)/2,
  );

  @override
  void initState() {
    super.initState();
    _moveToCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(color: Colors.white,), flex: 1,),
          Expanded(
              child: YandexMap(
                mapObjects: widget.mapObjects,
                onMapCreated: (controller) {
                  mapControllerCompleter.complete(controller);
                },
              ),
            flex: 4,
          ),
          Expanded(child: Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(248, 193, 204, 240),
                        Color.fromARGB(216, 45, 28, 98),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: TextButton(
                    onPressed: _requestRoutes,
                    child: NormalText(text: 'Построить маршрут'),
                ),
              ),
              ),
          ), flex: 2,
          ),
        ]
    );
  }

  Future<void> _moveToCurrentLocation(
      ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
          CameraPosition(
            target: point,
            zoom: zoom,
          )
      ),
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
            builder: (BuildContext context) => SessionPage(
                widget.mapObjects,
                resultWithSession.result,
              point,
              zoom
            )
        )
    );
  }

}
