import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(


      decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/login.png'),
        fit: BoxFit.cover
      ),
      ),
      child: Scaffold(
       backgroundColor: Colors.transparent,
        
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  
                   Padding(
                     padding: const EdgeInsets.only(right: 250),
                     child: Text("Login",
                        style:TextStyle(fontSize: 43,fontWeight: FontWeight.w400,color: Colors.white) ,),
                   ),
                    SizedBox(height: 27,),
                
                    SizedBox(
                      width: Get.width/1.12,
                       child: Column(
                        
                         children: [
                
                           TextField(
                                    decoration: InputDecoration(  
                                      prefixIcon: const Icon(Icons.mail),
                                      hintText: 'Email',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      filled: true, 
                                      fillColor: Colors.white,
                                    ),
                            
                           ),
                
                           SizedBox(height: 20,),
                
                
                           TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.lock),
                                      suffixIcon: Icon(Icons.visibility_off),
                                      hintText: 'Password',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      filled: true, 
                                      fillColor: Colors.white,
                                    ),
                            
                            ),
                    
                            SizedBox(height: 15,),
            
                            Padding(
                              padding: const EdgeInsets.only(left:220 ),
                              child: Text("Forgot Password ?"),
                            ),
                            SizedBox(height: 30,),
            
                            SizedBox(
                              width: Get.width/1.1,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color(0xFFC1121F))
                            
                                ),
                                onPressed: (){
                                  Get.to(HomePage());
                                  Get.snackbar("Success", "Login Successful",backgroundColor: Colors.green);
                            
                                }, 
                                child: Text("Login",style: TextStyle(fontSize: 20),)),
                            )
            
                            
                            
                    
                    
                    
                ],
              ),
                    ),
                ]
              ),
            ),
          )
        )
      ),
    );
  }
}