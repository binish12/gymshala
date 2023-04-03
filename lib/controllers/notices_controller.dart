
import 'dart:developer';
import 'package:get/get.dart';
import 'package:gymshala/model/notice_model.dart';
import '../repo/notice_repo.dart';

class NoticeController extends GetxController {

  RxInt unreadCount = RxInt(0);
  RxList<Notice> notices = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllNotices();
    super.onInit();
  }

  getAllNotices() async {
    loading.value = true;
    await NoticeRepo.getNotice(
      onSuccess: (notice) {
        loading.value = false;

        notices.addAll(notice);
        unreadCount.value += notice.length;
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
