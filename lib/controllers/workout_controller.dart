import 'dart:convert';

import 'package:get/get.dart';
import 'package:gymshala/api.dart';
import 'package:http/http.dart' as http;





class WorkoutController extends GetxController {
  

  Future<String?> getPdf({required int fileID}) async {
   

    
    var response = await http.get(Uri.parse('$getWorkoutAPI?id=$fileID'));
  
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["success"]) {
      List<String> data = List<String>.from(jsonResponse['data']);
      String binish = '$baseUrl${data[0]}';
      return binish;
    } else {
      return null;
    }
  }
}
