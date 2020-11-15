import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

const String _chaveApi = '3d7b4cd6d3373fd9527add50158dbd52';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLcoation();
  }

  void getLcoation() async {
    Location location = Location();
    await location.getCurrentLocation();
    getData(location.longitude, location.latitude);
  }

  void getData(double long, double lat) async {
    try {
      http.Response response = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$_chaveApi');
      if (response.statusCode == 200)
        print(response.body);
      else
        print('Errro ao requisitar a API!');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
