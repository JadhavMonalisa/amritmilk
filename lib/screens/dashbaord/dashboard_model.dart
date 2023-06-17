class CustomerListModel {
  String? message;
  bool? success;
  List<CustomerList>? customerList;

  CustomerListModel({this.message, this.success, this.customerList});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    success = json['Success'];
    if (json['customerList'] != null) {
      customerList = <CustomerList>[];
      json['customerList'].forEach((v) {
        customerList!.add(new CustomerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Success'] = this.success;
    if (this.customerList != null) {
      data['customerList'] = this.customerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerList {
  String? id;
  String? name;
  String? contact;
  String? email;
  String? address;
  String? barcode;
  String? password;
  String? status;
  String? type;
  String? token;
  String? createdAt;
  String? updateAt;

  CustomerList(
      {this.id,
        this.name,
        this.contact,
        this.email,
        this.address,
        this.barcode,
        this.password,
        this.status,
        this.type,
        this.token,
        this.createdAt,
        this.updateAt});

  CustomerList.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    name = json['name']??"";
    contact = json['contact']??"";
    email = json['email']??"";
    address = json['address']??"";
    barcode = json['barcode']??"";
    password = json['password']??"";
    status = json['status']??"";
    type = json['type']??"";
    token = json['token']??"";
    createdAt = json['created_at']??"";
    updateAt = json['update_at']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['address'] = this.address;
    data['barcode'] = this.barcode;
    data['password'] = this.password;
    data['status'] = this.status;
    data['type'] = this.type;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}