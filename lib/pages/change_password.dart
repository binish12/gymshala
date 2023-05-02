import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/profile_page/profile.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
       decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/profile.png'),
        fit: BoxFit.cover
      ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text("Change Password",
              style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white) ,),
        
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Center(
                  child: Column(
                            
                    children: [
                      
                            
                       SizedBox(
                        width: Get.width/1.05,
                         child: TextField(
                                                decoration: InputDecoration(  
                                                  prefixIcon: const Icon(Icons.mail),
                                                  hintText: 'Email',
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                  filled: true, 
                                                  fillColor: Colors.white,
                                                ),
                                        
                                       ),
                       ),
                          
                                     SizedBox(height: 20,),
                          
                          
                                     SizedBox(
                                      width: Get.width/1.05,
                                       child: TextField(
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  prefixIcon: const Icon(Icons.lock),
                                                  suffixIcon: Icon(Icons.visibility_off),
                                                  hintText: 'Current Password',
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                  filled: true, 
                                                  fillColor: Colors.white,
                                                ),
                                        
                                        ),
                                     ),
                            
                                      SizedBox(height: 20,),
                            
                                      SizedBox(
                                        width: Get.width/1.05,
                                        child: TextField(
                                                obscureText: true,
                                                decoration: InputDecoration(  
                                                  prefixIcon: const Icon(Icons.lock),
                                                  suffixIcon: Icon(Icons.visibility_off),
                                                  hintText: 'Enter New Password',
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                  filled: true, 
                                                  fillColor: Colors.white,
                                                ),
                                        
                                                                     ),
                                      ),
                          
                                     SizedBox(height: 20,),
                          
                          
                                     SizedBox(
                                      width: Get.width/1.05,
                                       child: TextField(
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  prefixIcon: const Icon(Icons.lock),
                                                  suffixIcon: Icon(Icons.visibility_off),
                                                  hintText: 'Confirm New Password',
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                  filled: true, 
                                                  fillColor: Colors.white,
                                                ),
                                        
                                        ),
                                     ),
                                      SizedBox(
                                        height: 30,
                                      ),
                            
                                      SizedBox(
                                        width: Get.width/1.2,
                                        height: 45,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll(Color(0xFFC1121F)),
                                                
                                          
                                              ),
                                              onPressed: (){
                                                Get.to(MyProfile());
                                                Get.snackbar("Success", "Login Successful",backgroundColor: Colors.green);
                                          
                                              }, 
                                              child: Text("Change Password",style: TextStyle(fontSize: 20),)),
                                        ),
                                      )
                    ],
                    
                  ),
                ),
              ),
            ],
          ),
        ),
    
    
    
    
    
    
    
      ),
    );
  }
}