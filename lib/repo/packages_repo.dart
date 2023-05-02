import 'dart:convert';
import 'dart:developer';

import 'package:gymshala/api.dart';


import 'package:http/http.dart' as http;

import '../model/packages_model.dart';

class PackageRepo {
  static Future<void> getPackage(
      {required Function(List<Package>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(getPackagesAPI);

      http.Response response = await http.get(
        url,
      );

      var data = json.decode(response.body);

      if (data['success']) {
        onSuccess(packagesFromJson(data['data']));
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}