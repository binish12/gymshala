import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/notification_page.dart';

class NotificationBellButton extends StatelessWidget {
  final RxInt notificationCount;


  const NotificationBellButton({super.key, required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            notificationCount.value = 0;
            Get.to(()=>  NotificationPage());
            

            // Handle notification button press
          },
        ),
        if (notificationCount > 0)
          Positioned(
            right: 6,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
