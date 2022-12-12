class ProductDuePayments {
  bool? success;
  List<Data>? data;
  String? message;

  ProductDuePayments({this.success, this.data, this.message});

  ProductDuePayments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  int? id;
  String? productName;
  String? createdAt;
  String? productAmount;
  int? paidAmount;
  int? totalAmount;

  Data(
      {this.id,
        this.productName,
        this.createdAt,
        this.productAmount,
        this.paidAmount,
        this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    createdAt = json['created_at'];
    productAmount = json['product_amount'];
    paidAmount = json['paid_amount'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['created_at'] = this.createdAt;
    data['product_amount'] = this.productAmount;
    data['paid_amount'] = this.paidAmount;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
