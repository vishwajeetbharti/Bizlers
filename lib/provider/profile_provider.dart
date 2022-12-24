import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  Future<List> makes2wVehicles() async {
    try {
      var url = Uri.http("test.turbocare.app", "/turbo/care/v1/makes?class=2w");
      var response = await http.get(url);
      List<dynamic> list = jsonDecode(response.body);
      if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: "getting: 404 error");
      }
      notifyListeners();
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List> makes4wVehicles() async {
    try {
      var url = Uri.http("test.turbocare.app", "/turbo/care/v1/makes?class=4w");
      var response = await http.get(url);
      List<dynamic> list = jsonDecode(response.body);
      if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: "getting: 404 error");
      }
      notifyListeners();
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List> hondaVehicles(String model) async {
    try {
      var url = Uri.http(
          "test.turbocare.app", "/turbo/care/v1/models?class=2w&make=$model");
      var response = await http.get(url);
      List<dynamic> list = jsonDecode(response.body);
      if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: "getting: 404 error");
      }
      notifyListeners();
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
