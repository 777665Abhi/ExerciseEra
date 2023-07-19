class ProfileModel {
  String? success;
  String? message;
  List<Data>? data;
  int? count;
  bool? status;

  ProfileModel(
      {this.success, this.message, this.data, this.count, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  var name;
  var mobile;
  var lastName;
  var locationName;
  var city;
  List<String>? candidateEducationVOList;
  var number;
  var email;
  var profileImage;
  var country;
  var profileUrl;
  List<String>? hours;
  List<String>? industryKeys;
  var profileBanner;
  var pageNumber;
  var countryName;
  bool? isSearchable;
  var accountNo;
  bool? selected;

  Data(
      {this.name,
        this.mobile,
        this.lastName,
        this.locationName,
        this.city,
        this.candidateEducationVOList,
        this.number,
        this.email,
        this.profileImage,
        this.country,
        this.profileUrl,
        this.hours,
        this.industryKeys,
        this.profileBanner,
        this.pageNumber,
        this.countryName,
        this.isSearchable,
        this.accountNo,
        this.selected});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    lastName = json['lastName'];
    locationName = json['locationName'];
    city = json['city'];
    candidateEducationVOList = json['candidateEducationVOList'].cast<String>();
    number = json['number'];
    email = json['email'];
    profileImage = json['profileImage'];
    country = json['country'];
    profileUrl = json['profileUrl'];
    hours = json['hours'].cast<String>();
    industryKeys = json['industryKeys'].cast<String>();
    profileBanner = json['profileBanner'];
    pageNumber = json['pageNumber'];
    countryName = json['countryName'];
    isSearchable = json['isSearchable'];
    accountNo = json['accountNo'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['lastName'] = this.lastName;
    data['locationName'] = this.locationName;
    data['city'] = this.city;
    data['candidateEducationVOList'] = this.candidateEducationVOList;
    data['number'] = this.number;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['country'] = this.country;
    data['profileUrl'] = this.profileUrl;
    data['hours'] = this.hours;
    data['industryKeys'] = this.industryKeys;
    data['profileBanner'] = this.profileBanner;
    data['pageNumber'] = this.pageNumber;
    data['countryName'] = this.countryName;
    data['isSearchable'] = this.isSearchable;
    data['accountNo'] = this.accountNo;
    data['selected'] = this.selected;
    return data;
  }
}
