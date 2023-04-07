import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/notices_controller.dart';
import 'custom_buttons/notification_bell.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});
  final noticecontroller = Get.put(NoticeController());
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC1121F),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 43,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Good Morning,",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Binish.K",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  NotificationBellButton(notificationCount: noticecontroller.unreadCount)
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height / 9.9);
}
