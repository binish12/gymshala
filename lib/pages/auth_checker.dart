import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/home_page.dart';
import 'package:gymshala/pages/login_page.dart';

import '../services/auth_service.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfLoggedIn();
  }


  Future<void> checkIfLoggedIn() async {
    AuthService authService = AuthService();
    var token = await authService.getToken();
    var role = await authService.getRole();

    if (token != null) {
      if (role == 'admin') {
        Get.offAll(() => LoginPage());
        Get.snackbar("Failed", "Login Failed");
      } else {
        Get.offAll(() => HomePage());
      }
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
