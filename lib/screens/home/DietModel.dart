class DietModel {
  String? success;
  String? message;
  List<DietData>? data;
  int? count;
  bool? status;

  DietModel({this.success, this.message, this.data, this.count, this.status});

  DietModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DietData>[];
      json['data'].forEach((v) {
        data!.add(new DietData.fromJson(v));
      });
    }
    count = json['count'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['status'] = this.status;
    return data;
  }
}

class DietData {
  String? title;
  String? goal;
  int? weightFrom;
  int? weightTo;
  int? ageFrom;
  int? ageTo;
  String? dietTypeDisplay;
  String? thumbnailUrl;
  int? price;
  String? status;
  String? id;
  String? userName;
  String? timePeriod;
  String? genderDisplay;
  double? avgRating;
  bool? isFree;

  DietData(
      {this.title,
        this.goal,
        this.weightFrom,
        this.weightTo,
        this.ageFrom,
        this.ageTo,
        this.dietTypeDisplay,
        this.thumbnailUrl,
        this.price,
        this.status,
        this.id,
        this.userName,
        this.timePeriod,
        this.genderDisplay,
        this.avgRating,
        this.isFree});

  DietData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    goal = json['goal'];
    weightFrom = json['weightFrom'];
    weightTo = json['weightTo'];
    ageFrom = json['ageFrom'];
    ageTo = json['ageTo'];
    dietTypeDisplay = json['dietTypeDisplay'];
    thumbnailUrl = json['thumbnailUrl'];
    price = json['price'];
    status = json['status'];
    id = json['id'];
    userName = json['userName'];
    timePeriod = json['timePeriod'];
    genderDisplay = json['genderDisplay'];
    avgRating = json['avgRating'];
    isFree = json['isFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['goal'] = this.goal;
    data['weightFrom'] = this.weightFrom;
    data['weightTo'] = this.weightTo;
    data['ageFrom'] = this.ageFrom;
    data['ageTo'] = this.ageTo;
    data['dietTypeDisplay'] = this.dietTypeDisplay;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['price'] = this.price;
    data['status'] = this.status;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['timePeriod'] = this.timePeriod;
    data['genderDisplay'] = this.genderDisplay;
    data['avgRating'] = this.avgRating;
    data['isFree'] = this.isFree;
    return data;
  }
}
