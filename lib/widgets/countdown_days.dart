

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    required this.percentage,
    required this.remainingDays,
    required this.progress,
  });

  final double percentage;
  final int remainingDays;
  final int progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Stack(
        children: <Widget>[
          Container(
            height: Get.height/9,
            width: Get.width/5.2,
            child: CircularProgressIndicator(
              color: Color(0xFFC1121F),
              value: percentage,
              backgroundColor: Colors.grey[300],
              strokeWidth: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:27,left: 29),
            child: Text(
              '$remainingDays',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
