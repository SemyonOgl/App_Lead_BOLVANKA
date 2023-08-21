import 'dart:async';
import 'package:app/pages/Map.dart';
import 'package:app/pages/elements/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SuggestionsExample();
  }
}

class _SuggestionsExample extends StatefulWidget {
  @override
  _SuggestionsExampleState createState() => _SuggestionsExampleState();
}

class _SuggestionsExampleState extends State<_SuggestionsExample> {

  TextEditingController queryController = TextEditingController();
  TextEditingController queryControllertwo = TextEditingController();
  late Future<SuggestSessionResult> resul;
  late Future<SuggestSessionResult> resultwo;
  String query = '';
  String querytwo = '';
  List<SuggestSessionResult> results = [];
  List<SuggestSessionResult> resultstwo = [];
  String start = 'Empity';
  String end = 'Empity';
  String city = 'Москва';

  @override
  void initState() {
    super.initState();
    query = '';
    querytwo = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar( //управляемая чёлка приложения
            pinned: true,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar( //надпись, увеличивающаяся при скролле вниз
              title: Text('Поиск'),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20),
              ExpansionTile(
                title: NormalText(text: 'Выберите город'),
                children: [
                  Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          ListTile(
                            title: NormalText(text: 'Москва'),
                            onTap: () {
                              setState(() {
                                city = 'Москва';
                                return ExpansionTileController.of(context).collapse();
                              });
                            },
                          ), //элемент списка
                          ListTile(
                            title: NormalText(text: 'Санкт-Петербург'),
                            onTap: () {
                              setState(() {
                                city = 'Санкт-Петербург';
                                return ExpansionTileController.of(context).collapse();
                              });
                            },
                          ),
                          ListTile(
                            title: NormalText(text: 'Между городами'),
                            onTap: () {
                              setState(() {
                                city = '';
                                return ExpansionTileController.of(context).collapse();
                              });
                            },
                          ),
                      ]
                      );
                }
                )
                ],
              ),
              SizedBox(height: 40),
              NormalText(text: 'Выбранный город: ' + city),
              SizedBox(height: 40),
              if(city != '')NormalText(text: 'Выберите улицы'),
              SizedBox(height: 40),
              if(start == 'Empity') TextField(
                controller: queryController,
                decoration: const InputDecoration(
                    hintText: 'Address part'),
              ),
              StreamBuilder<void>(
                  stream: streamText,
                  builder: (context, snappShot) {
                    if (results != []) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: _getList(),
                      );
                    }
                    else {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: [
                            Text('ничего не найдено')
                          ]
                      );
                    }
                  }
              ),
              if(start != 'Empity')ElevatedButton(
                onPressed: () {start = 'Empity';},
                child: Row(
                  children: [
                    Icon(Icons.clear),
                    NormalText(text: start),
                  ],
                )
              ),
              SizedBox(height: 40),
              if(end == 'Empity') TextField(
                controller: queryControllertwo,
                decoration: const InputDecoration(hintText: 'Address part'),
              ),
              StreamBuilder<void>(
                  stream: streamTexttwo,
                  builder: (context, snappShot) {
                    if (resultstwo.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _getListtwo(),
                      );
                    }
                    else {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ничего не найдено')
                          ]
                      );
                    }
                  }
              ),
              if(end != 'Empity')ElevatedButton(
                  onPressed: () {end = 'Empity';},
                  child: Row(
                    children: [
                      Icon(Icons.clear),
                      NormalText(text: end),
                    ],
                  )
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: InkWell(
                  onTap: () async {
                    if (start != 'Empity' && end != 'Empity') {
                    await Bring();
                    }
                  },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
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
                  child: NormalText(text: 'загрузить')
                ),
              ),
              ),
            ]
            ),
          ),
        ],
      ),
    );
  }

  Stream<void> get streamText async* {
    if(y != queryController.text || start == 'Empity')
    {
      y = queryController.text;
      yield await _suggest();
    }
  }

  Future _suggest() async {
    query = queryController.text;

    var resultWithSession = await YandexSuggest.getSuggestions(
        text: query,
        boundingBox: const BoundingBox(
            northEast: Point(latitude: 56.0421, longitude: 38.0284),
            southWest: Point(latitude: 55.5143, longitude: 37.24841)
        ),
        suggestOptions: const SuggestOptions(
            suggestType: SuggestType.geo,
            suggestWords: true,
            userPosition: Point(latitude: 56.0321, longitude: 38)
        )
    );

    resul = resultWithSession.result;

    print('Suggest query: $query $results');
    if (resul != null){
      return _handleResult(await resul);
    }
  }

  List<Widget> _getList() {
    final list = <Widget>[];

    if (results.isEmpty) {
      list.add((const Text('ничего не найдено')));
    }

    for (var r in results) {
      r.items!.asMap().forEach((i, item) {
        list.add(
            TextButton(onPressed: () {
              setState(() {
                start = item.title;
                queryController.text = '';
              });
            }, child: Text('Вариант $i: ${item.title}'))
        );
      });
    }
    return list;
  }

  Future<void> _handleResult(SuggestSessionResult result) async {
    if(result != null){
      setState(() {
        if (results.isEmpty) {
          results.add(result);
        } else {
          results.clear();
          results.add(result);
        };
      });
    }
  }

  String x = 'empty';

  String y = 'empty';

  Stream<void> get streamTexttwo async* {
    if(x != queryControllertwo.text || end == 'Empity')
    {
      x = queryControllertwo.text;
      yield await _suggesttwo();
    }
  }

  Future _suggesttwo() async {
    querytwo = queryControllertwo.text;

    var resultWithSession = await YandexSuggest.getSuggestions(
        text: querytwo,
        boundingBox: const BoundingBox(
            northEast: Point(latitude: 56.0421, longitude: 38.0284),
            southWest: Point(latitude: 55.5143, longitude: 37.24841)
        ),
        suggestOptions: const SuggestOptions(
            suggestType: SuggestType.geo,
            suggestWords: true,
            userPosition: Point(latitude: 56.0321, longitude: 38)
        )
    );

    resultwo = resultWithSession.result;

    if (resultwo != null)
    {
      return _handleResulttwo(await resultwo);
    }
  }

  List<Widget> _getListtwo() {
    final list = <Widget>[];

    if (resultstwo.isEmpty) {
      list.add((const Text('ничего не найдено')));
    }

    for (var r in resultstwo) {
      r.items!.asMap().forEach((i, item) {
        list.add(
            TextButton(onPressed: () {
              setState(() {
                end = item.title;
                queryControllertwo.text = '';
              });
            }, child: Text('Вариант $i: ${item.title}'))
        );
      });
    }
    return list;
  }

  Future<void> _handleResulttwo(SuggestSessionResult result) async {
    if(result != null){
      setState(() {
        if (resultstwo.isEmpty) {
          resultstwo.add(result);
        } else {
          resultstwo.clear();
          resultstwo.add(result);
        };
      });
    }}


  double longit = 0.0;

  double latit = 0.0;

  double longittwo = 0.0;

  double latittwo = 0.0;

  Bring() async {
    await _getAddressFromLatLng();
    await _getAddressFromLatLngtwo();
    await Bringtwo();
  }

  Bringtwo() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
                BuildContext context) =>
                BringCoord(longit, latit, longittwo, latittwo)
        )
    );
  }

  _getAddressFromLatLng() async {
    try {
      List<Location> placemarks = await locationFromAddress(city + start);

      Location place = placemarks[0];

      setState(() {
        longit = place.longitude;
        latit = place.latitude;
      });
    } catch (e) {
      print(e);
    }
  }
  _getAddressFromLatLngtwo() async {
    try {
      List<Location> placemarks = await locationFromAddress(city + end);

      Location place = placemarks[0];

      setState(() {
        longittwo = place.longitude;
        latittwo = place.latitude;
      });
    } catch (e) {
      print(e);
    }
  }
}