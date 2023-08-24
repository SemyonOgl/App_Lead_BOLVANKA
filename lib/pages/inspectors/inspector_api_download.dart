import 'dart:convert';
import 'dart:io';
import 'package:app/pages/RegLogin%20Pages/login.dart';
import 'package:app/pages/loagin.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

class ApiDownload extends StatefulWidget {
  const ApiDownload({super.key});

  @override
  State<ApiDownload> createState() => _ApiDownloadState();
}

class _ApiDownloadState extends State<ApiDownload> {

  bool loaging = false;

  var data;

  @override
  void initState() {
    init();
  }

  void init() async {
    loaging = true;
    User? deviceId = await _getId();
    print(deviceId?.uid.toString());
    await sendData(deviceId);

  }

  @override
  Widget build(BuildContext context) {
    return loaging ? LoginPage() : Loading();
  }


  Future<dynamic> sendData(User? user) async {
    final response = await http.post(Uri.parse(''),
        body: userToJson(user!),
        headers: {'': ''});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to send data');
    }
  }

  Future<User?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return User(uid: iosDeviceInfo.identifierForVendor!); // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return User(uid: androidDeviceInfo.id); // unique ID on Android
    }
  }

}
