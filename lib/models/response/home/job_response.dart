class JobsResponse {
  List<TodayJobs>? todayJobs;
  List<TodayJobs>? futureJobs;

  JobsResponse({this.todayJobs, this.futureJobs});

  JobsResponse.fromJson(Map<String, dynamic> json) {
    if (json['todayJobs'] != null) {
      todayJobs = <TodayJobs>[];
      json['todayJobs'].forEach((v) {
        todayJobs!.add(new TodayJobs.fromJson(v));
      });
    }
    if (json['futureJobs'] != null) {
      futureJobs = <TodayJobs>[];
      json['futureJobs'].forEach((v) {
        futureJobs!.add(new TodayJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todayJobs != null) {
      data['todayJobs'] = this.todayJobs!.map((v) => v.toJson()).toList();
    }
    if (this.futureJobs != null) {
      data['futureJobs'] = this.futureJobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodayJobs {
  int? jobId;
  String? notes;
  int? inspectionDate;
  User? user;

  TodayJobs({this.jobId, this.notes, this.inspectionDate, this.user});

  TodayJobs.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    notes = json['notes'];
    inspectionDate = json['inspectionDate'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.jobId;
    data['notes'] = this.notes;
    data['inspectionDate'] = this.inspectionDate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? fullname;
  String? email;
  String? phoneNumber;
  double? latitude;
  double? longitude;
  String? address;
  String? profileImage;

  User(
      {this.fullname,
        this.email,
        this.phoneNumber,
        this.latitude,
        this.longitude,
        this.address,
        this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['profileImage'] = this.profileImage;
    return data;
  }
}
