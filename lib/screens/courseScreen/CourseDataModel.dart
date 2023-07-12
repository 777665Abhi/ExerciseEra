class CourseDataModel {
  var success;
  var message;
  var count;
  DataOB? dataOB;
  bool? status;

  CourseDataModel(
      {this.success, this.message, this.count, this.dataOB, this.status});

  CourseDataModel.fromJson(Map<String, dynamic> json) {
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
  List<SectionVideosVOList>? sectionVideosVOList;
  CourseDetail? courseDetail;

  DataOB({this.sectionVideosVOList, this.courseDetail});

  DataOB.fromJson(Map<String, dynamic> json) {
    if (json['sectionVideosVOList'] != null) {
      sectionVideosVOList = <SectionVideosVOList>[];
      json['sectionVideosVOList'].forEach((v) {
        sectionVideosVOList!.add(new SectionVideosVOList.fromJson(v));
      });
    }
    courseDetail = json['courseDetail'] != null
        ? new CourseDetail.fromJson(json['courseDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sectionVideosVOList != null) {
      data['sectionVideosVOList'] =
          this.sectionVideosVOList!.map((v) => v.toJson()).toList();
    }
    if (this.courseDetail != null) {
      data['courseDetail'] = this.courseDetail!.toJson();
    }
    return data;
  }
}

class SectionVideosVOList {
  var id;
  var sectionName;
  List<SectionVideos>? sectionVideos;

  SectionVideosVOList({this.id, this.sectionName, this.sectionVideos});

  SectionVideosVOList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionName = json['sectionName'];
    if (json['sectionVideos'] != null) {
      sectionVideos = <SectionVideos>[];
      json['sectionVideos'].forEach((v) {
        sectionVideos!.add(new SectionVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectionName'] = this.sectionName;
    if (this.sectionVideos != null) {
      data['sectionVideos'] =
          this.sectionVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionVideos {
  var id;
  var title;
  bool? isVideoUploaded;
  var sectionKey;

  SectionVideos({this.id, this.title, this.isVideoUploaded, this.sectionKey});

  SectionVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isVideoUploaded = json['isVideoUploaded'];
    sectionKey = json['sectionKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['isVideoUploaded'] = this.isVideoUploaded;
    data['sectionKey'] = this.sectionKey;
    return data;
  }
}

class CourseDetail {
  var id;
  var title;
  var subTitle;
  var description;
  var categoryId;
  var price;
  var currancy;
  var levelString;
  var videoCount;
  var sectionCount;
  var videoUrl;
  var userProfileImage;
  var userName;
  var avgRating;
  var isFree;
  List<String>? learningPoints;

  CourseDetail(
      {this.id,
        this.title,
        this.subTitle,
        this.description,
        this.categoryId,
        this.price,
        this.currancy,
        this.levelString,
        this.videoCount,
        this.sectionCount,
        this.videoUrl,
        this.userProfileImage,
        this.userName,
        this.avgRating,
        this.learningPoints,
      this.isFree});

  CourseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    description = json['description'];
    categoryId = json['categoryId'];
    price = json['price'];
    currancy = json['currancy'];
    levelString = json['levelString'];
    videoCount = json['videoCount'];
    sectionCount = json['sectionCount'];
    videoUrl = json['videoUrl'];
    userProfileImage = json['userProfileImage'];
    userName = json['userName'];
    avgRating = json['avgRating'];
    learningPoints = json['learningPoints'].cast<String>();
    isFree=json['isFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['price'] = this.price;
    data['currancy'] = this.currancy;
    data['levelString'] = this.levelString;
    data['videoCount'] = this.videoCount;
    data['sectionCount'] = this.sectionCount;
    data['videoUrl'] = this.videoUrl;
    data['userProfileImage'] = this.userProfileImage;
    data['userName'] = this.userName;
    data['avgRating'] = this.avgRating;
    data['learningPoints'] = this.learningPoints;
    data['isFree']= this.isFree;
    return data;
  }
}
