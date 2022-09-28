class LoginResponse {
  int? managerId;
  String? fullname;
  String? bio;
  String? profileImage;
  String? phoneNumber;
  double? latitude;
  double? longitude;
  String? address;
  Authentication? authentication;

  LoginResponse(
      {this.managerId,
        this.fullname,
        this.bio,
        this.profileImage,
        this.phoneNumber,
        this.latitude,
        this.longitude,
        this.address,
        this.authentication});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    managerId = json['managerId'];
    fullname = json['fullname'];
    bio = json['bio'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    authentication = json['authentication'] != null
        ? new Authentication.fromJson(json['authentication'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['managerId'] = this.managerId;
    data['fullname'] = this.fullname;
    data['bio'] = this.bio;
    data['profileImage'] = this.profileImage;
    data['phoneNumber'] = this.phoneNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    if (this.authentication != null) {
      data['authentication'] = this.authentication!.toJson();
    }
    return data;
  }
}

class Authentication {
  String? accessToken;
  String? refreshToken;
  int? expiresAt;

  Authentication({this.accessToken, this.refreshToken, this.expiresAt});

  Authentication.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['expiresAt'] = this.expiresAt;
    return data;
  }
}
