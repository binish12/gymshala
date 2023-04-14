import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/workout_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AllItemCard extends StatelessWidget {
  AllItemCard({
    Key? key,
    required this.imgs,
    required this.name,
    required this.fileId,
   
  }) : super(key: key);

  final String imgs;
  final String name;
  final int fileId;
  

  final workoutController = Get.put(WorkoutController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        height: Get.height / 3,
        width: Get.width / 1.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 201, 197, 197),
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 9,
              color: const Color(0xFF494949).withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                 
                        onTap: () async {
                          final pdfUrl =
                              await workoutController.getPdf(fileID: fileId);
                          await launchInBrowser(pdfUrl.toString());
                        },
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(9)),
                width: Get.width / 1.1,
                height: 175,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                    imageUrl: imgs,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/man.png',
                      height: 87,
                      fit: BoxFit.contain,
                    ),
                    height: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 1.15,
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> launchInBrowser(String url) async {
    try {
      final Uri toLaunch = Uri.parse(url);
      await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
    } catch (e) {
      log("could not launch ------->");
    }
  }
}
