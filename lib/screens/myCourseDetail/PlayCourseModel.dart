class PlayCourseModel {
  String? success;
  String? message;
  List<Data>? data;
  int? count;
  bool? status;

  PlayCourseModel(
      {this.success, this.message, this.data, this.count, this.status});

  PlayCourseModel.fromJson(Map<String, dynamic> json) {
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
  String? sectionName;
  List<SectionVideos>? sectionVideos;

  Data({this.id, this.sectionName, this.sectionVideos});

  Data.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? title;
  bool? isVideoUploaded;
  int? sectionKey;
  String? fileExtension;
  String? fileId;

  SectionVideos(
      {this.id,
        this.title,
        this.isVideoUploaded,
        this.sectionKey,
        this.fileExtension,
        this.fileId});

  SectionVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isVideoUploaded = json['isVideoUploaded'];
    sectionKey = json['sectionKey'];
    fileExtension = json['fileExtension'];
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['isVideoUploaded'] = this.isVideoUploaded;
    data['sectionKey'] = this.sectionKey;
    data['fileExtension'] = this.fileExtension;
    data['fileId'] = this.fileId;
    return data;
  }
}
