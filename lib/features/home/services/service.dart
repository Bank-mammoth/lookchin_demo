import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class AppService {
  var url = Uri.parse('https://fakestoreapi.com/products');

  Future<List<dynamic>> getDataFromAPI() async {
    http.Response response = await http.get(url);
    Random mathRan = Random();

    //fake error 404
    if (mathRan.nextDouble() < 0.5) {
      throw 'Fail to get Product';
    }


    try {
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      rethrow;
    }
  }
}
