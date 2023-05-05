import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/model/packages_model.dart';
import 'package:gymshala/pages/login_page.dart';
import 'package:gymshala/pages/packages_page.dart';
import 'package:http/http.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../controllers/authentication_controlller.dart';


class MembershipPage extends StatelessWidget {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
  final registerController = Get.put(AuthenticationController());
   MembershipPage({super.key});

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text("Membership Form",
                  style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white) ,),
                SizedBox(height: 60,),
                 Center(
                   child: SizedBox(
                    width: Get.width/1.1,
                     child: Column(
                       children: [
              
                         TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(  
                                    contentPadding: EdgeInsets.symmetric(vertical:16),
                                    prefixIcon: const Icon(Icons.person),
                                    hintText: 'Full Name',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    filled: true, 
                                    fillColor: Colors.white,
                                  ),
                          
                         ),
                  
                                SizedBox(height: 15,),
                          
                          TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:16),
                                    prefixIcon: const Icon(Icons.home),
                                    hintText: 'Address',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    filled: true, 
                                    fillColor: Colors.white,
                                  ),
                          
                          ),
                  
                                SizedBox(height: 15,),
                  
                          TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:16),
                                    prefixIcon: const Icon(Icons.phone),
                                    hintText: 'Phone number',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    filled: true, 
                                    fillColor: Colors.white,
                                  ),
                          
                          ),
                  
                                SizedBox(height: 15,),
                  
                          TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:16),
                                    prefixIcon: const Icon(Icons.mail),
                                    hintText: 'Email',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    filled: true, 
                                    fillColor: Colors.white,
                                  ),
                          
                          ),
                  
                                SizedBox(height: 15,),
                  
                          TextField(
                                  controller:passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:16),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: Icon(Icons.visibility_off),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    filled: true, 
                                    fillColor: Colors.white,
                                  ),
                          
                          ),
                  
                                SizedBox(height: 15,),
                          
                          TextField(
                                  controller: confirmController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical:16),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: Icon(Icons.visibility_off),
                                    hintText: 'Confirm Password',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    filled: true, 
                                    fillColor: Colors.white,
                                  ),
                          
                          ),
                          SizedBox(height: 5,),
                          TextButton(
                            onPressed: (){
                             
                                Get.to(() => LoginPage());

                            }, 
                            child: Text("Already have an account ?",style: TextStyle(fontSize: 15),),
                            ),
                           

                          
                          SizedBox(height: 30,),
   
                           SizedBox(
                              width: Get.width/1.1,
                              height: 44,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    
                                    backgroundColor: MaterialStatePropertyAll(Color(0xFFC1121F))
                                                          
                                  ),
                                  onPressed: (){
                          
                                     if (passwordController.text != confirmController.text) {
                                    // Passwords don't match, show error message
                                      Get.snackbar("Error", "Password does not match",backgroundColor: Colors.red,colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM);
                                      return;
                                     }
                                     Get.to(()=> MyPackages(nameController: nameController,addressController: addressController,
                                     phoneController: phoneController,usernameController: usernameController,passwordController: passwordController,));

                                  // registerController.register(
                                  //     fullName: nameController.text,
                                  //     username: usernameController.text,
                                  //     address: addressController.text,
                                  //     phoneNumber: phoneController.text,
                                  //     password: passwordController.text);


                                                          
                                  }, 
                                  child: Text("Continue",style: TextStyle(fontSize: 20),)),
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
      ),
    );
  }
}