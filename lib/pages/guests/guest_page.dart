import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/profile.png'),
        fit: BoxFit.cover
      ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Text(
              ""

            )
          ],




        ),





      ),


    );
  }
}