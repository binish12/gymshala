import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/login_page.dart';


class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Membership Form",
              style:TextStyle(fontSize: 24,fontWeight: FontWeight.w600) ,),
            SizedBox(height: 30,),
             Center(
               child: SizedBox(
                width: Get.width/1.1,
                 child: Column(
                   children: [

                     TextField(
                              decoration: InputDecoration(  
                                prefixIcon: const Icon(Icons.person),
                                hintText: 'Full Name',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                     ),
      
                            SizedBox(height: 15,),
                      
                      TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.home),
                                hintText: 'Address',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                      ),
      
                            SizedBox(height: 15,),
      
                      TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.phone),
                                hintText: 'Phone number',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                      ),
      
                            SizedBox(height: 15,),
      
                      TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.mail),
                                hintText: 'Email',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                      ),
      
                            SizedBox(height: 15,),
      
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
                      
                      TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                filled: true, 
                                // fillColor: Colors.white,
                              ),
                      
                      ),
                      SizedBox(height: 15,),
                           

                      ElevatedButton(
                        onPressed: () {

                        },
                        child: Text("Payment")
                      ),

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFFC1121F),)


                        ),
                        onPressed: () {
                          Get.to(() => LoginPage());

                        },
                        child: Text("Register Membership"),
                        
                      ),


      
      
      
                        
                   ],
                 ),
               ),
             ),
          ],
      
        ),
      ),
    );
  }
}