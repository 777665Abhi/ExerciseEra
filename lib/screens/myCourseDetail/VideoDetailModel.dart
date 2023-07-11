class VideoDetailModel {
  String? success;
  String? message;
  int? count;
  DataOB? dataOB;
  bool? status;

  VideoDetailModel(
      {this.success, this.message, this.count, this.dataOB, this.status});

  VideoDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? title;
  String? videoUrl;
  String? fileExtension;
  String? fileId;

  DataOB({this.id, this.title, this.videoUrl, this.fileExtension, this.fileId});

  DataOB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
    fileExtension = json['fileExtension'];
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['videoUrl'] = this.videoUrl;
    data['fileExtension'] = this.fileExtension;
    data['fileId'] = this.fileId;
    return data;
  }
}
