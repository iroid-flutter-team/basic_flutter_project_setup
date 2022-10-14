class ManagerDetailsResponse {
  int? managerId;
  String? fullname;
  String? bio;
  String? profileImage;
  double? latitude;
  double? longitude;
  String? address;
  String? phoneNumber;
  num? avgRating;

  ManagerDetailsResponse(
      {this.managerId,
        this.fullname,
        this.bio,
        this.profileImage,
        this.latitude,
        this.longitude,
        this.address,
        this.phoneNumber,
        this.avgRating});

  ManagerDetailsResponse.fromJson(Map<String, dynamic> json) {
    managerId = json['managerId'];
    fullname = json['fullname'];
    bio = json['bio'];
    profileImage = json['profileImage'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['managerId'] = this.managerId;
    data['fullname'] = this.fullname;
    data['bio'] = this.bio;
    data['profileImage'] = this.profileImage;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['avgRating'] = this.avgRating;
    return data;
  }
}

