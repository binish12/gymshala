import 'dart:convert';
import 'dart:developer';

import 'package:gymshala/api.dart';
import 'package:gymshala/model/foods_model.dart';

import 'package:http/http.dart' as http;

class FoodRepo {
  static Future<void> getFood(
      {required Function(List<Food>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(getFoodsAPI);

      http.Response response = await http.get(
        url,
      );

      var data = json.decode(response.body);

      if (data['success']) {
        onSuccess(foodsFromJson(data['data']));
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}