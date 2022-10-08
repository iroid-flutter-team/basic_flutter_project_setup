class QuestionsResponse {
  int? questionId;
  String? title;
  String? description;
  List<Checklists>? checklists;
  Answer? answer;

  QuestionsResponse(
      {this.questionId,
        this.title,
        this.description,
        this.checklists,
        this.answer});

  QuestionsResponse.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    title = json['title'];
    description = json['description'];
    if (json['checklists'] != null) {
      checklists = <Checklists>[];
      json['checklists'].forEach((v) {
        checklists!.add(Checklists.fromJson(v));
      });
    }
    answer =
    json['answer'] != null ? Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.checklists != null) {
      data['checklists'] = this.checklists!.map((v) => v.toJson()).toList();
    }
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    return data;
  }
}

class Checklists {
  int? checklistId;
  String? option;
  bool? isChecked;

  Checklists({this.checklistId, this.option, this.isChecked});

  Checklists.fromJson(Map<String, dynamic> json) {
    checklistId = json['checklistId'];
    option = json['option'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['checklistId'] = this.checklistId;
    data['option'] = this.option;
    data['isChecked'] = this.isChecked;
    return data;
  }
}

class Answer {
  int? answerId;
  String? notes;
  var tags;
  String? location;
  num? rating;
  List<Images>? images;

  Answer(
      {this.answerId,
        this.notes,
        this.tags,
        this.location,
        this.rating,
        this.images});

  Answer.fromJson(Map<String, dynamic> json) {
    answerId = json['answerId'];
    notes = json['notes'];
    tags = json['tags'];
    location = json['location'];
    rating = json['rating'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['answerId'] = this.answerId;
    data['notes'] = this.notes;
    data['tags'] = this.tags;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imageId'] = this.imageId;
    data['image'] = this.image;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['totalPage'] = this.totalPage;
    data['currentPage'] = this.currentPage;
    return data;
  }
}
