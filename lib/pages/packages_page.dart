import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/authentication_controlller.dart';
import 'package:gymshala/pages/login_page.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:http/http.dart';
import '../controllers/packages_controller.dart';
import '../model/packages_model.dart';
import 'home_page.dart';

class MyPackages extends StatelessWidget {
   MyPackages({super.key,required this.nameController, required this.addressController,
   required this.passwordController,required this.phoneController,required this.usernameController});
 final PackageController packageController = Get.put(PackageController());
 final registerController = Get.put(AuthenticationController());
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    


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
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 160,),
              Text('Payment',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),),
              SizedBox(height: 100,),
              Obx(() => DropdownButton<String>(
                    iconSize: 29,
                    value: packageController.selectedPackage.value?.packageName,
                    onChanged: (String? value) {
                      packageController.selectedPackage.value =
                          packageController.packages.firstWhere(
                              (element) => element.packageName == value);
                    },
                    items: packageController.packages
                        .map<DropdownMenuItem<String>>(
                            (Package package) => DropdownMenuItem<String>(
                                  value: package.packageName,
                                  child: Text(package.packageName!),
                                ))
                        .toList(),
                    hint: Text('Select package'),
                  )),

              Obx(() => DropdownButton<String>(
                    iconSize: 29,
                    value: packageController.selectedPackage.value?.amount,
                    onChanged: (String? value) {
                      packageController.selectedPackage.value!.amount = value!;
                    },
                    items: packageController.selectedPackage.value != null
                        ? [DropdownMenuItem<String>(
                            value: packageController.selectedPackage.value!.amount,
                            child: Text(packageController.selectedPackage.value!.amount!),
                          )]
                        : null,
                    hint: Text('Select amount'),
                  )),

                  SizedBox(height: 10,),
    
                  InkWell(
                              onTap: () {
    
              //                   KhaltiScope.of(context).pay(
              //       config: PaymentConfig(
              // amount:  10000,
              // productIdentity: "productIdentity",
              // productName: "productName",
              //       ),
              //       preferences: [
              // PaymentPreference.khalti,
              //       ],
              //       onSuccess: (success) {
              // Get.snackbar("Success", "Payment Successful",backgroundColor: Colors.green);
              // Get.off(HomePage());
                
              // // paymentController.token.value = success.token;
              // // paymentController.amount.value = success.amount;
                
              // log("tnx id -----------${success.token.toString()}");
              // // payment = paymentController.token.toString();
              // // paymentController.postPayment();
              // // postOrder();
              // // CustomSnackBar.success(title: "Payment", message: "Payment Successful");
              //       },
              //       onFailure: (fa) {
              // Get.snackbar("Success", "Payment Failed",backgroundColor: Colors.red);
              // // CustomSnackBar.error(title: "Payment", message: "Payment Failure");
              //       },
              //       onCancel: () {
              // Get.snackbar("Cancelled", "Payment Cancelled",backgroundColor: Colors.red);
              // // CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
              //       },
              //     );
                                
                              },
                              child: Container(
                                height: 80,
                                width: 140,
                                 decoration: BoxDecoration(
                                    image: DecorationImage(
                                    image: AssetImage('assets/images/khalti.png'),
                                    fit: BoxFit.cover
                                  ),
                              ),
                            
                              ),
                            ),
                            SizedBox(height: 130,),

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
                                    
                                KhaltiScope.of(context).pay(
                    config: PaymentConfig(
              amount:  10000,
              productIdentity: "productIdentity",
              productName: "productName",
                    ),
                    preferences: [
              PaymentPreference.khalti,
                    ],
                    onSuccess: (success) {
                      Get.snackbar("Success", "Payment Successful",backgroundColor: Colors.green);
                      
                      registerController.register(
                                      fullName: nameController.text,
                                      username: usernameController.text,
                                      address: addressController.text,
                                      phoneNumber: phoneController.text,
                                      password: passwordController.text);
                      
                      Get.off(()=> LoginPage());
                        
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
                                    // Get.to(() => LoginPage());
                                    // Get.snackbar("Success", "Registration Successful",backgroundColor: Colors.green,duration: Duration(hours: 1));
                                                          
                                  }, 
                                  child: Text("Pay with Khalti",style: TextStyle(fontSize: 20),)),
                              ),
                            )
            ],
          ),
        ),
      ),
    );
  }
}
