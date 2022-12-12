class DuePayments {
  bool? success;
  List<Data>? data;
  String? message;

  DuePayments({this.success, this.data, this.message});

  DuePayments.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? amountToBePaid;
  int? paidAmount;
  int? discount;
  String? dueDate;
  String? membership;
  int? id;

  Data(
      {this.amountToBePaid,
        this.paidAmount,
        this.discount,
        this.dueDate,
        this.membership,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    amountToBePaid = json['amount_to_be_paid'];
    paidAmount = json['paid_amount'];
    discount = json['discount'];
    dueDate = json['due_date'];
    membership = json['membership'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount_to_be_paid'] = amountToBePaid;
    data['paid_amount'] = paidAmount;
    data['discount'] = discount;
    data['due_date'] = dueDate;
    data['membership'] = membership;
    data['id'] = id;
    return data;
  }
}