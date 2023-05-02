import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/home_page.dart';
import 'package:gymshala/pages/login_page.dart';
import 'package:http/http.dart';
import 'package:khalti_flutter/khalti_flutter.dart';


class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});

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
                SizedBox(height: 35,),
                 Center(
                   child: SizedBox(
                    width: Get.width/1.1,
                     child: Column(
                       children: [
              
                         TextField(
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
                          SizedBox(height: 12,),

                          InkWell(
                            onTap: () {

                              KhaltiScope.of(context).pay(
                  config: PaymentConfig(
            amount:  100000,
            productIdentity: "productIdentity",
            productName: "productName",
                  ),
                  preferences: [
            PaymentPreference.khalti,
                  ],
                  onSuccess: (success) {
            Get.snackbar("Success", "Payment Successful",backgroundColor: Colors.green);
            Get.off(HomePage());
              
            // paymentController.token.value = success.token;
            // paymentController.amount.value = success.amount;
              
            log("tnx id -----------${success.token.toString()}");
            // payment = paymentController.token.toString();
            // paymentController.postPayment();
            // postOrder();
            // CustomSnackBar.success(title: "Payment", message: "Payment Successful");
                  },
                  onFailure: (fa) {
            Get.snackbar("Success", "Payment Failed",backgroundColor: Colors.red);
            // CustomSnackBar.error(title: "Payment", message: "Payment Failure");
                  },
                  onCancel: () {
            Get.snackbar("Cancelled", "Payment Cancelled",backgroundColor: Colors.red);
            // CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
                  },
                );
                              
                            },
                            child: Container(
                              height: 70,
                              width: 110,
                               decoration: BoxDecoration(
                                  image: DecorationImage(
                                  image: AssetImage('assets/images/khalti.jpg'),
                                  fit: BoxFit.cover
                                ),
                            ),
                          
                            ),
                          ),
                          SizedBox(height: 10,),
                               
              
                         
              
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
                                    Get.to(LoginPage());
                                    // Get.snackbar("Success", "Registration Successful",backgroundColor: Colors.green,duration: Duration(hours: 1));
                                                          
                                  }, 
                                  child: Text("Register",style: TextStyle(fontSize: 20),)),
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