import 'dart:convert';
import 'dart:developer';

import 'package:gymshala/api.dart';

import 'package:http/http.dart' as http;

import '../model/banners_model.dart';

class BannerRepo {
  static Future<void> getBanner(
      {required Function(List<Banner>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(getBannersAPI);

      http.Response response = await http.get(
        url,
      );

      var data = json.decode(response.body);

      if (data['success']) {
        onSuccess(bannerFromJson(data['data']));
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}