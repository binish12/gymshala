import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gymshala/membership/membership.dart';

import '../../widgets/bottom_navbar.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (() {
               Get.to(MembershipPage());
                
                
              }
              ),
              
              
              child: Text("Button")
              ),
              

              
          )
        ],
      ),

      bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 3),
    );
  }
}