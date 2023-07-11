class CourseDetailModel {
  String? success;
  String? message;
  int? count;
  DataOB? dataOB;
  bool? status;

  CourseDetailModel(
      {this.success, this.message, this.count, this.dataOB, this.status});

  CourseDetailModel.fromJson(Map<String, dynamic> json) {
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
  var id;
  var title;
  var subTitle;
  var description;
  var categoryId;
  var levelString;
  var videoCount;
  var sectionCount;
  var videoUrl;
  var userProfileImage;
  var userName;
  var avgRating;
  List<String>? learningPoints;
  bool? isFree;

  DataOB(
      {this.id,
        this.title,
        this.subTitle,
        this.description,
        this.categoryId,
        this.levelString,
        this.videoCount,
        this.sectionCount,
        this.videoUrl,
        this.userProfileImage,
        this.userName,
        this.avgRating,
        this.learningPoints,
        this.isFree});

  DataOB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    description = json['description'];
    categoryId = json['categoryId'];
    levelString = json['levelString'];
    videoCount = json['videoCount'];
    sectionCount = json['sectionCount'];
    videoUrl = json['videoUrl'];
    userProfileImage = json['userProfileImage'];
    userName = json['userName'];
    avgRating = json['avgRating'];
    learningPoints = json['learningPoints'].cast<String>();
    isFree = json['isFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['levelString'] = this.levelString;
    data['videoCount'] = this.videoCount;
    data['sectionCount'] = this.sectionCount;
    data['videoUrl'] = this.videoUrl;
    data['userProfileImage'] = this.userProfileImage;
    data['userName'] = this.userName;
    data['avgRating'] = this.avgRating;
    data['learningPoints'] = this.learningPoints;
    data['isFree'] = this.isFree;
    return data;
  }
}
