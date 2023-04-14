import 'dart:convert';
import 'dart:developer';

import 'package:gymshala/api.dart';

import 'package:http/http.dart' as http;

import '../model/banners_model.dart';

class BannerRepo {
  static Future<void> getBanner(
      {required Function(List<BannerPics> totalData) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(getBannersAPI);

      http.Response response = await http.get(
        url,
      );

      var data = json.decode(response.body);
      print(data);

      if (data['success']) {
        
        print(data['data']);

        List<BannerPics> bannerPics=bannerFromJson(data['data']);
        onSuccess(bannerPics);
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}