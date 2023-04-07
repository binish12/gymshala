import 'dart:convert';

import 'package:get/get.dart';
import 'package:gymshala/api.dart';
import 'package:http/http.dart' as http;





class BannerkoController extends GetxController {
  

  Future<void> getPdf() async {
    try {
      var response = await http.get(Uri.parse('$getBannersAPI'));
  
      var bin = jsonDecode(response.body);

    

    }

    catch(e){
      print(e);
    }
   

    
    
    
  }
}
