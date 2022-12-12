class SubscriptionResponse {
  bool? success;
  List<Data>? data;
  String? message;

  SubscriptionResponse({this.success, this.data, this.message});

  SubscriptionResponse.fromJson(Map<String, dynamic> json) {
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
  int? amountToBePaid;
  int? paidAmount;
  String? membership;
  String? date;
  String? nextPaymentDate;
  String? expiresOn;
  int? id;
  String? status;

  Data(
      {this.amountToBePaid,
        this.paidAmount,
        this.membership,
        this.date,
        this.nextPaymentDate,
        this.expiresOn,
        this.id,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    amountToBePaid = json['amount_to_be_paid'];
    paidAmount = json['paid_amount'];
    membership = json['membership'];
    date = json['date'];
    nextPaymentDate = json['next_payment_date'];
    expiresOn = json['expires_on'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount_to_be_paid'] = this.amountToBePaid;
    data['paid_amount'] = this.paidAmount;
    data['membership'] = this.membership;
    data['date'] = this.date;
    data['next_payment_date'] = this.nextPaymentDate;
    data['expires_on'] = this.expiresOn;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}