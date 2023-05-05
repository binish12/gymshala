import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gymshala/api.dart';
import 'package:gymshala/pages/login_page.dart';
import 'package:http/http.dart' as http;

import '../pages/auth_checker.dart';
import '../pages/home_page.dart';
import '../services/auth_service.dart';

class AuthenticationController extends GetxController {
  final AuthService authService = AuthService();

  var loading = false.obs;

  Future<void> login({required String username, required String password}) async {
    var data = {'username': username, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(loginAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);

    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      var token = decodedResponse["token"];
      var role = decodedResponse["role"];
      await authService.saveToken(token, role);

      // Navigate to the authenticated screen
      Get.offAll(() => const HomePage());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  Future<void> register({required String fullName,required String username,required String address,required String phoneNumber, required String password}) async {
    var data = {'full_name': fullName,'username': username,'address': address,'phone_number': phoneNumber, 'password': password};
    loading.value = true;
    log(jsonEncode(data).toString());
    log(signupAPI);
    var response = await http.post(Uri.parse(signupAPI), body: data);
    loading.value = false;
    log(response.toString());
    var decodedResponse = await jsonDecode(response.body);

    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      // var token = decodedResponse["token"];
      // var role = decodedResponse["role"];
      // await authService.saveToken(token, role);

      // Navigate to the authenticated screen
      Get.offAll(() =>  LoginPage());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }
}
