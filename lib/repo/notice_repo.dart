import 'dart:convert';
import 'dart:developer';

import 'package:gymshala/api.dart';
import 'package:gymshala/model/notice_model.dart';
import 'package:http/http.dart' as http;

class NoticeRepo {
  static Future<void> getNotice(
      {required Function(List<Notice>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(getNoticesAPI);

      http.Response response = await http.get(
        url,
      );

      var data = json.decode(response.body);

      if (data['success']) {
        onSuccess(noticeFromJson(data['data']));
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}