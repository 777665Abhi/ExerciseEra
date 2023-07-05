class CoursesModel {
  var success;
  var message;
  List<CourseList>? data;
  var count;
  var status;

  CoursesModel(
      {this.success, this.message, this.data, this.count, this.status});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CourseList>[];
      json['data'].forEach((v) {
        data!.add(new CourseList.fromJson(v));
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

class CourseList {
  var id;
  var title;
  var subTitle;
  var thumbnailUrl;
  var price;
  var status;
  var levelString;
  var videoCount;
  var sectionCount;
  var userName;
  var avgRating;
  var includedDietPlan;
  var genderString;
  var userId;
  var isFree;

  CourseList(
      {this.id,
        this.title,
        this.subTitle,
        this.thumbnailUrl,
        this.price,
        this.status,
        this.levelString,
        this.videoCount,
        this.sectionCount,
        this.userName,
        this.avgRating,
        this.includedDietPlan,
        this.genderString,
        this.userId,
        this.isFree});

  CourseList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    thumbnailUrl = json['thumbnailUrl'];
    price = json['price'];
    status = json['status'];
    levelString = json['levelString'];
    videoCount = json['videoCount'];
    sectionCount = json['sectionCount'];
    userName = json['userName'];
    avgRating = json['avgRating'];
    includedDietPlan = json['includedDietPlan'];
    genderString = json['genderString'];
    userId = json['userId'];
    isFree = json['isFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['price'] = this.price;
    data['status'] = this.status;
    data['levelString'] = this.levelString;
    data['videoCount'] = this.videoCount;
    data['sectionCount'] = this.sectionCount;
    data['userName'] = this.userName;
    data['avgRating'] = this.avgRating;
    data['includedDietPlan'] = this.includedDietPlan;
    data['genderString'] = this.genderString;
    data['userId'] = this.userId;
    data['isFree'] = this.isFree;
    return data;
  }
}
