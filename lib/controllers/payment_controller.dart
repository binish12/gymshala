// import 'dart:convert';
// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import 'package:khalti_flutter/khalti_flutter.dart';


// class PaymentController extends GetxController {
//   var token = "".obs;
//   var amount = 0.obs;

//   void postPayment() async {
//     try {
//       // log("tnx id -----------${token.toString()}");
//       // log("tnx id -----------${amount.toString()}");
//       // log("tnx id -----------${currentUser.id.toString()}");

//       var response = await http.post(
//         Uri.parse(paymentAPI),
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           "user_id" : '',
//           "token": token.value,
//           "amount": (amount.value/100).toString(),
//         }),
//       );
//       // print(response);
      
//       Map responseMap = await jsonDecode(response.body);
//       // print(responseMap);
//       if (response.statusCode == 200) {
//       } else {
//         throw Exception("Failed to post payment");
//       }
//     } catch (e) {
//       log(e.toString());
//       throw Exception("Error occurred while posting payment: ${e.toString()}");
//     }
//   }

//   payWithKhalti(context) {
//     KhaltiScope.of(context).pay(
//       config: PaymentConfig(
//         amount: 20000,
//         productIdentity: "jhasdklas",
//         productName: "dsdjksldasd",
//       ),
//       preferences: [
//         PaymentPreference.khalti,
//       ],
//       onSuccess: (success) {
//         token.value = success.token;
//         amount.value = success.amount;
        
//         postPayment();
//         Get.snackbar("Payment Success", 'The Payment is successfully completed.');
//       },
//       onFailure: (fa) {
//         Get.snackbar("Payment Fail ", 'Your Payment has failed. Please Try again!');
//       },
//       onCancel: () {
       
//         Get.snackbar("Payment Cancelled ", 'You have cancelled your payment.');
//       },
//     );
//   }
// }