class ReviewResponse {
  int? id;
  int? managerId;
  int? userId;
  String? description;
  num? rating;
  String? userFullName;
  String? userProfileImage;
  int? createdAt;

  ReviewResponse(
      {this.id,
        this.managerId,
        this.userId,
        this.description,
        this.rating,
        this.userFullName,
        this.userProfileImage,
        this.createdAt});

  ReviewResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    managerId = json['managerId'];
    userId = json['userId'];
    description = json['description'];
    rating = json['rating'];
    userFullName = json['userFullName'];
    userProfileImage = json['userProfileImage'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['managerId'] = this.managerId;
    data['userId'] = this.userId;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['userFullName'] = this.userFullName;
    data['userProfileImage'] = this.userProfileImage;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

