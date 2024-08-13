class SignupModel {
  Message? message;
  Data? data;
  String? type;

  SignupModel({this.message, this.data, this.type});

  SignupModel.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Message {
  List<String>? success;

  Message({this.success});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? token;
  UserInfo? userInfo;

  Data({this.token, this.userInfo});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? mobile;
  String? country;
  String? mobileCode;
  int? emailVerified;

  UserInfo(
      {this.id,
        this.firstname,
        this.lastname,
        this.username,
        this.email,
        this.mobile,
        this.country,
        this.mobileCode,
        this.emailVerified});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    country = json['country'];
    mobileCode = json['mobile_code'];
    emailVerified = json['email_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['country'] = this.country;
    data['mobile_code'] = this.mobileCode;
    data['email_verified'] = this.emailVerified;
    return data;
  }
}
