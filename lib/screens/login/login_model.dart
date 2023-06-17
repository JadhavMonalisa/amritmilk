class LoginModel {
  String? message;
  bool? success;
  UserDetails? userDetails;

  LoginModel({this.message, this.success, this.userDetails});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    success = json['Success'];
    userDetails = json['UserDetails'] != null
        ? new UserDetails.fromJson(json['UserDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Success'] = this.success;
    if (this.userDetails != null) {
      data['UserDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? id;
  String? name;
  String? contact;
  String? email;
  String? address;
  String? userId;
  String? type;
  String? password;
  String? token;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.id,
        this.name,
        this.contact,
        this.email,
        this.address,
        this.userId,
        this.type,
        this.password,
        this.token,
        this.createdAt,
        this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    email = json['email'];
    address = json['address'];
    userId = json['user_id'];
    type = json['type'];
    password = json['password'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['address'] = this.address;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['password'] = this.password;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}