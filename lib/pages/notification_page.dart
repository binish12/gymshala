import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gymshala/controllers/notices_controller.dart';
import 'package:gymshala/model/notice_model.dart';



class NotificationPage extends StatelessWidget {
     NotificationPage({super.key});
  final noticecontroller = Get.put(NoticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NotificationPage"),
      ),
      body: Container(
                color: Colors.greenAccent,
                height: Get.height,
                width: Get.width,
                
                child:  
        
          ListView.builder(
          shrinkWrap: true,
          itemCount: noticecontroller.notices.length,
          itemBuilder: (context,index){ Notice notice = noticecontroller.notices[index];
              return  Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    ListTile(
                                  leading: const Icon(Icons.campaign,size: 35,),
                                  title: Text(notice.title??"",
                                            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight:FontWeight.bold,fontSize: 18),),
                                  subtitle: Text(notice.description??"",
                                            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 17),),
                                  
                                  


                    ),
                  ],
                ),
              );
       
            }
          ),
                
              ),

      
    );
  }
}