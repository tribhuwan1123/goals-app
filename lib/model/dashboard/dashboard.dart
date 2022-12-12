class Dashboard {
  bool? success;
  Data? data;
  String? message;

  Dashboard({this.success, this.data, this.message});

  Dashboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  CustomerValues? customerValues;
  CustomerBusiness? customerBusiness;
  List<Notifications>? notifications;
  String? qrSubscription;
  int? unreadNotifications;
  String? totalAmountPaid;
  int? totalSubscriptions;
  List<ExpiringSubscriptions>? expiringSubscriptions;
  List<DuePayments>? duePayments;
  List<PaymentCharts>? paymentCharts;
  List<DefaultDietPlan>? defaultDietPlan;
  List<DefaultDietPlan>? clientDietPlan;
  List<DefaultTrainingPlan>? defaultTrainingPlan;
  List<DefaultTrainingPlan>? clientTrainingPlan;
  List<ClassSchedule>? classSchedule;

  Data(
      {this.customerValues,
        this.customerBusiness,
        this.notifications,
        this.qrSubscription,
        this.unreadNotifications,
        this.totalAmountPaid,
        this.totalSubscriptions,
        this.expiringSubscriptions,
        this.duePayments,
        this.paymentCharts,
        this.defaultDietPlan,
        this.clientDietPlan,
        this.defaultTrainingPlan,
        this.clientTrainingPlan,
        this.classSchedule});

  Data.fromJson(Map<String, dynamic> json) {
    customerValues = json['customerValues'] != null
        ? CustomerValues.fromJson(json['customerValues'])
        : null;
    customerBusiness = json['customerBusiness'] != null
        ? CustomerBusiness.fromJson(json['customerBusiness'])
        : null;
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
    qrSubscription = json['qr_subscription'];
    unreadNotifications = json['unreadNotifications'];
    totalAmountPaid = json['totalAmountPaid'];
    totalSubscriptions = json['totalSubscriptions'];
    if (json['expiringSubscriptions'] != null) {
      expiringSubscriptions = <ExpiringSubscriptions>[];
      json['expiringSubscriptions'].forEach((v) {
        expiringSubscriptions!.add(ExpiringSubscriptions.fromJson(v));
      });
    }
    if (json['duePayments'] != null) {
      duePayments = <DuePayments>[];
      json['duePayments'].forEach((v) {
        duePayments!.add(DuePayments.fromJson(v));
      });
    }
    if (json['paymentCharts'] != null) {
      paymentCharts = <PaymentCharts>[];
      json['paymentCharts'].forEach((v) {
        paymentCharts!.add(PaymentCharts.fromJson(v));
      });
    }
    if (json['default_diet_plan'] != null) {
      defaultDietPlan = <DefaultDietPlan>[];
      json['default_diet_plan'].forEach((v) {
        defaultDietPlan!.add(DefaultDietPlan.fromJson(v));
      });
    }
    if (json['client_diet_plan'] != null) {
      clientDietPlan = <DefaultDietPlan>[];
      json['client_diet_plan'].forEach((v) {
        clientDietPlan!.add(DefaultDietPlan.fromJson(v));
      });
    }
    if (json['default_training_plan'] != null) {
      defaultTrainingPlan = <DefaultTrainingPlan>[];
      json['default_training_plan'].forEach((v) {
        defaultTrainingPlan!.add(DefaultTrainingPlan.fromJson(v));
      });
    }
    if (json['client_training_plan'] != null) {
      clientTrainingPlan = <DefaultTrainingPlan>[];
      json['client_training_plan'].forEach((v) {
        clientTrainingPlan!.add(DefaultTrainingPlan.fromJson(v));
      });
    }
    if (json['class_schedule'] != null) {
      classSchedule = <ClassSchedule>[];
      json['class_schedule'].forEach((v) {
        classSchedule!.add(ClassSchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (customerValues != null) {
      data['customerValues'] = customerValues!.toJson();
    }
    if (customerBusiness != null) {
      data['customerBusiness'] = customerBusiness!.toJson();
    }
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    data['qr_subscription'] = qrSubscription;
    data['unreadNotifications'] = unreadNotifications;
    data['totalAmountPaid'] = totalAmountPaid;
    data['totalSubscriptions'] = totalSubscriptions;
    if (expiringSubscriptions != null) {
      data['expiringSubscriptions'] =
          expiringSubscriptions!.map((v) => v.toJson()).toList();
    }
    if (duePayments != null) {
      data['duePayments'] = duePayments!.map((v) => v.toJson()).toList();
    }
    if (paymentCharts != null) {
      data['paymentCharts'] =
          paymentCharts!.map((v) => v.toJson()).toList();
    }
    if (defaultDietPlan != null) {
      data['default_diet_plan'] =
          defaultDietPlan!.map((v) => v.toJson()).toList();
    }
    if (clientDietPlan != null) {
      data['client_diet_plan'] =
          clientDietPlan!.map((v) => v.toJson()).toList();
    }
    if (defaultTrainingPlan != null) {
      data['default_training_plan'] =
          defaultTrainingPlan!.map((v) => v.toJson()).toList();
    }
    if (clientTrainingPlan != null) {
      data['client_training_plan'] =
          clientTrainingPlan!.map((v) => v.toJson()).toList();
    }
    if (classSchedule != null) {
      data['class_schedule'] =
          classSchedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerValues {
  int? id;
  int? personnelId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dob;
  String? gender;
  String? email;
  String? address;
  String? mobile;
  String? joiningDate;
  int? weight;
  dynamic? fat;
  int? heightFeet;
  int? heightInches;
  int? chest;
  int? waist;
  int? arms;
  String? image;
  String? clientSource;
  String? maritalStatus;
  String? anniversary;
  String? occupation;
  String? occupationDetails;
  String? resetPasswordToken;
  String? createdAt;
  String? updatedAt;
  int? detailId;

  CustomerValues(
      {this.id,
        this.personnelId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.dob,
        this.gender,
        this.email,
        this.address,
        this.mobile,
        this.joiningDate,
        this.weight,
        this.fat,
        this.heightFeet,
        this.heightInches,
        this.chest,
        this.waist,
        this.arms,
        this.image,
        this.clientSource,
        this.maritalStatus,
        this.anniversary,
        this.occupation,
        this.occupationDetails,
        this.resetPasswordToken,
        this.createdAt,
        this.updatedAt,
        this.detailId});

  CustomerValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personnelId = json['personnel_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    gender = json['gender'];
    email = json['email'];
    address = json['address'];
    mobile = json['mobile'];
    joiningDate = json['joining_date'];
    weight = json['weight'];
    fat = json['fat'];
    heightFeet = json['height_feet'];
    heightInches = json['height_inches'];
    chest = json['chest'];
    waist = json['waist'];
    arms = json['arms'];
    image = json['image'];
    clientSource = json['client_source'];
    maritalStatus = json['marital_status'];
    anniversary = json['anniversary'];
    occupation = json['occupation'];
    occupationDetails = json['occupation_details'];
    resetPasswordToken = json['reset_password_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detailId = json['detail_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['personnel_id'] = personnelId;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['dob'] = dob;
    data['gender'] = gender;
    data['email'] = email;
    data['address'] = address;
    data['mobile'] = mobile;
    data['joining_date'] = joiningDate;
    data['weight'] = weight;
    data['fat'] = fat;
    data['height_feet'] = heightFeet;
    data['height_inches'] = heightInches;
    data['chest'] = chest;
    data['waist'] = waist;
    data['arms'] = arms;
    data['image'] = image;
    data['client_source'] = clientSource;
    data['marital_status'] = maritalStatus;
    data['anniversary'] = anniversary;
    data['occupation'] = occupation;
    data['occupation_details'] = occupationDetails;
    data['reset_password_token'] = resetPasswordToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['detail_id'] = detailId;
    return data;
  }
}

class CustomerBusiness {
  int? id;
  int? detailId;
  int? customerId;
  String? createdAt;
  String? updatedAt;

  CustomerBusiness(
      {this.id,
        this.detailId,
        this.customerId,
        this.createdAt,
        this.updatedAt});

  CustomerBusiness.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detailId = json['detail_id'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['detail_id'] = detailId;
    data['customer_id'] = customerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


class Notifications {
  int? customerId;
  String? notificationType;
  String? title;

  Notifications({this.customerId, this.notificationType, this.title});

  Notifications.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    notificationType = json['notification_type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customer_id'] = customerId;
    data['notification_type'] = notificationType;
    data['title'] = title;
    return data;
  }
}

class ExpiringSubscriptions {
  String? firstName;
  String? lastName;
  String? startDate;
  String? expiresOn;
  String? membership;
  int? dueAmount;
  int? id;

  ExpiringSubscriptions(
      {this.firstName,
        this.lastName,
        this.startDate,
        this.expiresOn,
        this.membership,
        this.dueAmount,
        this.id});

  ExpiringSubscriptions.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    startDate = json['start_date'];
    expiresOn = json['expires_on'];
    membership = json['membership'];
    dueAmount = json['due_amount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['start_date'] = startDate;
    data['expires_on'] = expiresOn;
    data['membership'] = membership;
    data['due_amount'] = dueAmount;
    data['id'] = id;
    return data;
  }
}

class DuePayments {
  String? firstName;
  String? lastName;
  int? amountToBePaid;
  int? paid;
  String? dueDate;
  String? membership;
  int? id;

  DuePayments(
      {this.firstName,
        this.lastName,
        this.amountToBePaid,
        this.paid,
        this.dueDate,
        this.membership,
        this.id});

  DuePayments.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    amountToBePaid = json['amount_to_be_paid'];
    paid = json['paid'];
    dueDate = json['due_date'];
    membership = json['membership'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['amount_to_be_paid'] = amountToBePaid;
    data['paid'] = paid;
    data['due_date'] = dueDate;
    data['membership'] = membership;
    data['id'] = id;
    return data;
  }
}

class PaymentCharts {
  String? s;
  int? m;

  PaymentCharts({this.s, this.m});

  PaymentCharts.fromJson(Map<String, dynamic> json) {
    s = json['S'];
    m = json['M'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['S'] = s;
    data['M'] = m;
    return data;
  }
}

class DefaultDietPlan {
  int? id;
  int? clientId;
  int? branchId;
  String? days;
  String? breakfast;
  String? lunch;
  String? dinner;
  String? meal4;
  String? meal5;
  String? image;
  String? createdAt;
  String? updatedAt;

  DefaultDietPlan(
      {this.id,
        this.clientId,
        this.branchId,
        this.days,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.meal4,
        this.meal5,
        this.image,
        this.createdAt,
        this.updatedAt});

  DefaultDietPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    branchId = json['branch_id'];
    days = json['days'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    meal4 = json['meal_4'];
    meal5 = json['meal_5'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['client_id'] = clientId;
    data['branch_id'] = branchId;
    data['days'] = days;
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    data['meal_4'] = meal4;
    data['meal_5'] = meal5;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ClientDietPlan {
  int? id;
  int? clientId;
  int? branchId;
  String? days;
  String? breakfast;
  String? lunch;
  String? dinner;
  String? meal4;
  String? meal5;
  Null? image;
  String? createdAt;
  String? updatedAt;

  ClientDietPlan(
      {this.id,
        this.clientId,
        this.branchId,
        this.days,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.meal4,
        this.meal5,
        this.image,
        this.createdAt,
        this.updatedAt});

  ClientDietPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    branchId = json['branch_id'];
    days = json['days'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    meal4 = json['meal_4'];
    meal5 = json['meal_5'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['client_id'] = clientId;
    data['branch_id'] = branchId;
    data['days'] = days;
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    data['meal_4'] = meal4;
    data['meal_5'] = meal5;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DefaultTrainingPlan {
  int? id;
  int? clientId;
  int? branchId;
  String? days;
  String? level;
  String? activity;
  String? sets;
  String? repetition;
  String? weights;
  String? restTime;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  DefaultTrainingPlan(
      {this.id,
        this.clientId,
        this.branchId,
        this.days,
        this.level,
        this.activity,
        this.sets,
        this.repetition,
        this.weights,
        this.restTime,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt});

  DefaultTrainingPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    branchId = json['branch_id'];
    days = json['days'];
    level = json['level'];
    activity = json['activity'];
    sets = json['sets'];
    repetition = json['repetition'];
    weights = json['weights'];
    restTime = json['restTime'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['client_id'] = clientId;
    data['branch_id'] = branchId;
    data['days'] = days;
    data['level'] = level;
    data['activity'] = activity;
    data['sets'] = sets;
    data['repetition'] = repetition;
    data['weights'] = weights;
    data['restTime'] = restTime;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ClientTrainingPlan {
  int? id;
  int? clientId;
  int? branchId;
  String? days;
  String? level;
  String? activity;
  String? sets;
  String? repetition;
  String? weights;
  String? restTime;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  ClientTrainingPlan(
      {this.id,
        this.clientId,
        this.branchId,
        this.days,
        this.level,
        this.activity,
        this.sets,
        this.repetition,
        this.weights,
        this.restTime,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt});

  ClientTrainingPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    branchId = json['branch_id'];
    days = json['days'];
    level = json['level'];
    activity = json['activity'];
    sets = json['sets'];
    repetition = json['repetition'];
    weights = json['weights'];
    restTime = json['restTime'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['client_id'] = clientId;
    data['branch_id'] = branchId;
    data['days'] = days;
    data['level'] = level;
    data['activity'] = activity;
    data['sets'] = sets;
    data['repetition'] = repetition;
    data['weights'] = weights;
    data['restTime'] = restTime;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ClassSchedule {
  int? id;
  int? branchId;
  String? className;
  String? trainer;
  String? days;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;

  ClassSchedule(
      {this.id,
        this.branchId,
        this.className,
        this.trainer,
        this.days,
        this.startTime,
        this.endTime,
        this.createdAt,
        this.updatedAt});

  ClassSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    className = json['className'];
    trainer = json['trainer'];
    days = json['days'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['branch_id'] = branchId;
    data['className'] = className;
    data['trainer'] = trainer;
    data['days'] = days;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}