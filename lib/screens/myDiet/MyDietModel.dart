class MyDietModel {
  String? success;
  String? message;
  List<Data>? data;
  int? count;
  bool? status;

  MyDietModel({this.success, this.message, this.data, this.count, this.status});

  MyDietModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  String? title;
  String? thumbnailUrl;
  int? price;
  String? userName;
  String? weight;
  String? age;
  String? dietPlanId;
  String? orderNo;

  Data(
      {this.id,
        this.title,
        this.thumbnailUrl,
        this.price,
        this.userName,
        this.weight,
        this.age,
        this.dietPlanId,
        this.orderNo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    price = json['price'];
    userName = json['userName'];
    weight = json['weight'];
    age = json['age'];
    dietPlanId = json['dietPlanId'];
    orderNo = json['orderNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['price'] = this.price;
    data['userName'] = this.userName;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['dietPlanId'] = this.dietPlanId;
    data['orderNo'] = this.orderNo;
    return data;
  }
}
