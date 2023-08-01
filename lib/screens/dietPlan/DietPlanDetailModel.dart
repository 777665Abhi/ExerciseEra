class DietPlanDetailModel {
  String? success;
  String? message;
  int? count;
  DataOB? dataOB;
  bool? status;

  DietPlanDetailModel(
      {this.success, this.message, this.count, this.dataOB, this.status});

  DietPlanDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    count = json['count'];
    dataOB =
    json['dataOB'] != null ? new DataOB.fromJson(json['dataOB']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.dataOB != null) {
      data['dataOB'] = this.dataOB!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class DataOB {
  String? title;
  String? goal;
  int? weightFrom;
  int? weightTo;
  int? ageFrom;
  int? ageTo;
  int? dietType;
  String? description;
  String? thumbnailUrl;
  int? price;
  String? id;
  List<String>? achivementPoints;
  String? userName;
  bool? isFree;

  DataOB(
      {this.title,
        this.goal,
        this.weightFrom,
        this.weightTo,
        this.ageFrom,
        this.ageTo,
        this.dietType,
        this.description,
        this.thumbnailUrl,
        this.price,
        this.id,
        this.achivementPoints,
        this.userName,
        this.isFree});

  DataOB.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    goal = json['goal'];
    weightFrom = json['weightFrom'];
    weightTo = json['weightTo'];
    ageFrom = json['ageFrom'];
    ageTo = json['ageTo'];
    dietType = json['dietType'];
    description = json['description'];
    thumbnailUrl = json['thumbnailUrl'];
    price = json['price'];
    id = json['id'];
    achivementPoints = json['achivementPoints'].cast<String>();
    userName = json['userName'];
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
    data['dietType'] = this.dietType;
    data['description'] = this.description;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['price'] = this.price;
    data['id'] = this.id;
    data['achivementPoints'] = this.achivementPoints;
    data['userName'] = this.userName;
    data['isFree'] = this.isFree;
    return data;
  }
}
