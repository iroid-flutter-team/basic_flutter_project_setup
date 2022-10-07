class ResultsResponse {
  var averageRating;
  List<Results>? results;

  ResultsResponse({this.averageRating, this.results});

  ResultsResponse.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['averageRating'] = this.averageRating;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? answerId;
  String? title;
  String? notes;
  String? location;
  var rating;
  List<Images>? images;

  Results(
      {this.answerId,
        this.title,
        this.notes,
        this.location,
        this.rating,
        this.images});

  Results.fromJson(Map<String, dynamic> json) {
    answerId = json['answerId'];
    title = json['title'];
    notes = json['notes'];
    location = json['location'];
    rating = json['rating'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerId'] = this.answerId;
    data['title'] = this.title;
    data['notes'] = this.notes;
    data['location'] = this.location;
    data['rating'] = this.rating;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? imageId;
  String? image;

  Images({this.imageId, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    imageId = json['imageId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageId'] = this.imageId;
    data['image'] = this.image;
    return data;
  }
}