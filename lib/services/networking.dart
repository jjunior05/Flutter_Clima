import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper{
  Networkhelper(this.url);
  final String url;

  Future getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
       return jsonDecode(data);
      }
      else
        print('Errro ao requisitar a API!');
    } catch (e) {
      print(e);
    }
  }

}