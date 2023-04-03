List<Notice> noticeFromJson(
        List<dynamic> noticeJson) =>
    List<Notice>.from(noticeJson.map((noticeJson) =>
        Notice.fromJson(noticeJson)));

class Notice {
  String? title;
  String? description;

  Notice({this.title, this.description});

  Notice.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}