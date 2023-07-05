class LoginModel {
  String? success;
  String? message;
  int? count;
  DataOB? dataOB;
  bool? status;

  LoginModel(
      {this.success, this.message, this.count, this.dataOB, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  var accessToken;
  var tokenType;
  var refreshToken;
  var expiresIn;
  var scope;
  var userType;
  var jti;
  var userId;
  var isWizardCompleted;
  var username;

  DataOB(
      {this.accessToken,
        this.tokenType,
        this.refreshToken,
        this.expiresIn,
        this.scope,
        this.userType,
        this.jti,
        this.userId,
        this.isWizardCompleted,
        this.username});

  DataOB.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    userType = json['user_type'];
    jti = json['jti'];
    userId = json['user_id'];
    isWizardCompleted = json['is_wizard_completed'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    data['scope'] = this.scope;
    data['user_type'] = this.userType;
    data['jti'] = this.jti;
    data['user_id'] = this.userId;
    data['is_wizard_completed'] = this.isWizardCompleted;
    data['username'] = this.username;
    return data;
  }
}
