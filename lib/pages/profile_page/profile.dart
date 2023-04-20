import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gymshala/membership/membership.dart';
import 'package:gymshala/pages/change_password.dart';
import 'package:gymshala/pages/login_page.dart';

import '../../widgets/bottom_navbar.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/profile.png'),
        fit: BoxFit.cover
      ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    const Icon(Icons.dark_mode),
                    const SizedBox(width: 20,),
                    const Text("Dark Mode",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(width: 200,),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),


                Row(
                  children: [
                    const SizedBox(width: 20,),
                    const Icon(Icons.fitness_center),
                    const SizedBox(width: 20,),
                    const Text("My Workouts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(width: 200,),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),


                Row(
                  children: [
                    const SizedBox(width: 20,),
                    const Icon(Icons.light_mode),
                    const SizedBox(width: 20,),
                    const Text("Change Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(width: 150,),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),


                Row(
                  children: [
                    const SizedBox(width: 20,),
                    const Icon(Icons.dark_mode),
                    const SizedBox(width: 20,),
                    const Text("Dark Mode",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(width: 200,),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                )

              ],
            )










            // Center(
            //   child: ElevatedButton(
            //     onPressed: (() {
            //      Get.to(MembershipPage());
            //       // Get.snackbar("Failed", "Invalid Email Address",backgroundColor: Colors.grey,duration: Duration(hours: 1));
                  
            //     }
            //     ),
                
                
            //     child: Text("Button")
            //     ),
    
    
                
    
                
            // ),
            // ElevatedButton(
            //   onPressed: (){
            //     Get.to(LoginPage());
                
            //   }, 
            //   child: Text("Login")),
    
            //   ElevatedButton(
            //   onPressed: (){
            //     Get.to(LoginPage());
            //     Get.snackbar("Success", "Logout Successful",backgroundColor: Colors.grey);
            //   }, 
            //   child: Text("Logout")),
    
            //   ElevatedButton(
            //   onPressed: (){
            //     Get.to(ChangePassword());
                
            //   }, 
            //   child: Text("Change password"))
          ],
        ),
    
        bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 3),
      ),
    );
  }
}