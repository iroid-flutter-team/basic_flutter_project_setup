class HistoryResponse {
  int? jobId;
  var averageRating;
  int? inspectionDate;
  int? userId;
  String? fullname;
  String? address;
  String? profileImage;

  HistoryResponse(
      {this.jobId,
        this.averageRating,
        this.inspectionDate,
        this.userId,
        this.fullname,
        this.address,
        this.profileImage});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    averageRating = json['averageRating'];
    inspectionDate = json['inspectionDate'];
    userId = json['userId'];
    fullname = json['fullname'];
    address = json['address'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.jobId;
    data['averageRating'] = this.averageRating;
    data['inspectionDate'] = this.inspectionDate;
    data['userId'] = this.userId;
    data['fullname'] = this.fullname;
    data['address'] = this.address;
    data['profileImage'] = this.profileImage;
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
