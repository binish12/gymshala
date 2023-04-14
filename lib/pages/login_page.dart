import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children:  [
             Text("Login",
                style:TextStyle(fontSize: 24,fontWeight: FontWeight.w600) ,),
              SizedBox(height: 30,),

              SizedBox(
                width: Get.width/1.1,
                 child: Column(
                  
                   children: [

                     TextField(
                              decoration: InputDecoration(  
                                prefixIcon: const Icon(Icons.mail),
                                hintText: 'Email',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                     ),

                     SizedBox(height: 20,),


                     TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: 'Password',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                      ),
      
                            SizedBox(height: 15,),
                      
                      
      
                            SizedBox(height: 15,),
      

      
      
      
          ],
        ),
      ),
          ]
        )
      )
    );
  }
}