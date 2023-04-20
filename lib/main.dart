import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/home_page.dart';
import 'package:khalti_flutter/khalti_flutter.dart';


void main() async {
  
  
  WidgetsFlutterBinding.ensureInitialized(
    
  );
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  KhaltiScope(
        publicKey: "test_public_key_f18b878e02d64e10988f46aea7baa233",
        builder: (context, navigatorKey) {
          return
          GetMaterialApp(
            
                  navigatorKey: navigatorKey,
                  supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('ne', 'NP'),
                  ],
                  localizationsDelegates: const [
                    KhaltiLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  
                  title: 'GymShala',
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(backgroundColor: Color(0xFFC1121F),)
                  ),
                  
                 home: const HomePage(), 
                 
                );
        });
  }
}
