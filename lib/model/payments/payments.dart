class Payments {
  bool? success;
  List<Data>? data;
  String? message;

  Payments({this.success, this.data, this.message});

  Payments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? pid;
  String? firstName;
  String? lastName;
  String? productName;
  int? paymentAmount;
  String? membership;
  String? paymentSource;
  String? paymentDate;
  String? paymentId;
  Null? paymentType;
  int? purchaseId;

  Data(
      {this.pid,
        this.firstName,
        this.lastName,
        this.productName,
        this.paymentAmount,
        this.membership,
        this.paymentSource,
        this.paymentDate,
        this.paymentId,
        this.paymentType,
        this.purchaseId});

  Data.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    productName = json['product_name'];
    paymentAmount = json['payment_amount'];
    membership = json['membership'];
    paymentSource = json['payment_source'];
    paymentDate = json['payment_date'];
    paymentId = json['payment_id'];
    paymentType = json['payment_type'];
    purchaseId = json['purchase_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['product_name'] = this.productName;
    data['payment_amount'] = this.paymentAmount;
    data['membership'] = this.membership;
    data['payment_source'] = this.paymentSource;
    data['payment_date'] = this.paymentDate;
    data['payment_id'] = this.paymentId;
    data['payment_type'] = this.paymentType;
    data['purchase_id'] = this.purchaseId;
    return data;
  }
}