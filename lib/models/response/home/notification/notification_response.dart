class NotificationResponse {
  int? notificationId;
  String? title;
  Null? message;
  Null? type;
  int? readAt;
  Null? createdAt;

  NotificationResponse(
      {this.notificationId,
        this.title,
        this.message,
        this.type,
        this.readAt,
        this.createdAt});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    title = json['title'];
    message = json['message'];
    type = json['type'];
    readAt = json['readAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['type'] = this.type;
    data['readAt'] = this.readAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? totalPage;
  int? currentPage;

  Meta({this.total, this.perPage, this.totalPage, this.currentPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['totalPage'] = this.totalPage;
    data['currentPage'] = this.currentPage;
    return data;
  }
}
