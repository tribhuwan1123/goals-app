class Dashboard {
  Dashboard({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String message;

  Dashboard.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.customerValues,
    required this.customerBusiness,
    required this.gymSettings,
    required this.notifications,
    required this.unreadNotifications,
    required this.totalAmountPaid,
    required this.totalSubscriptions,
    required this.expiringSubscriptions,
    required this.duePayments,
    required this.paymentCharts,
    required this.defaultDietPlan,
    required this.clientDietPlan,
    required this.defaultTrainingPlan,
    required this.clientTrainingPlan,
    required this.classSchedule,
  });
  late final CustomerValues customerValues;
  late final CustomerBusiness customerBusiness;
  late final GymSettings gymSettings;
  late final List<Notifications> notifications;
  late final int unreadNotifications;
  late final String totalAmountPaid;
  late final int totalSubscriptions;
  late final List<ExpiringSubscriptions> expiringSubscriptions;
  late final List<DuePayments> duePayments;
  late final List<PaymentCharts> paymentCharts;
  late final List<DefaultDietPlan> defaultDietPlan;
  late final List<ClientDietPlan> clientDietPlan;
  late final List<DefaultTrainingPlan> defaultTrainingPlan;
  late final List<ClientTrainingPlan> clientTrainingPlan;
  late final List<ClassSchedule> classSchedule;

  Data.fromJson(Map<String, dynamic> json){
    customerValues = CustomerValues.fromJson(json['customerValues']);
    customerBusiness = CustomerBusiness.fromJson(json['customerBusiness']);
    gymSettings = GymSettings.fromJson(json['gymSettings']);
    notifications = List.from(json['notifications']).map((e)=>Notifications.fromJson(e)).toList();
    unreadNotifications = json['unreadNotifications'];
    totalAmountPaid = json['totalAmountPaid'];
    totalSubscriptions = json['totalSubscriptions'];
    expiringSubscriptions = List.from(json['expiringSubscriptions']).map((e)=>ExpiringSubscriptions.fromJson(e)).toList();
    duePayments = List.from(json['duePayments']).map((e)=>DuePayments.fromJson(e)).toList();
    paymentCharts = List.from(json['paymentCharts']).map((e)=>PaymentCharts.fromJson(e)).toList();
    defaultDietPlan = List.from(json['default_diet_plan']).map((e)=>DefaultDietPlan.fromJson(e)).toList();
    clientDietPlan = List.from(json['client_diet_plan']).map((e)=>ClientDietPlan.fromJson(e)).toList();
    defaultTrainingPlan = List.from(json['default_training_plan']).map((e)=>DefaultTrainingPlan.fromJson(e)).toList();
    clientTrainingPlan = List.from(json['client_training_plan']).map((e)=>ClientTrainingPlan.fromJson(e)).toList();
    classSchedule = List.from(json['class_schedule']).map((e)=>ClassSchedule.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customerValues'] = customerValues.toJson();
    _data['customerBusiness'] = customerBusiness.toJson();
    _data['gymSettings'] = gymSettings.toJson();
    _data['notifications'] = notifications.map((e)=>e.toJson()).toList();
    _data['unreadNotifications'] = unreadNotifications;
    _data['totalAmountPaid'] = totalAmountPaid;
    _data['totalSubscriptions'] = totalSubscriptions;
    _data['expiringSubscriptions'] = expiringSubscriptions.map((e)=>e.toJson()).toList();
    _data['duePayments'] = duePayments.map((e)=>e.toJson()).toList();
    _data['paymentCharts'] = paymentCharts.map((e)=>e.toJson()).toList();
    _data['default_diet_plan'] = defaultDietPlan.map((e)=>e.toJson()).toList();
    _data['client_diet_plan'] = clientDietPlan.map((e)=>e.toJson()).toList();
    _data['default_training_plan'] = defaultTrainingPlan.map((e)=>e.toJson()).toList();
    _data['client_training_plan'] = clientTrainingPlan.map((e)=>e.toJson()).toList();
    _data['class_schedule'] = classSchedule.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CustomerValues {
  CustomerValues({
    required this.id,
    this.personnelId,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.email,
    required this.address,
    required this.mobile,
    required this.joiningDate,
    this.weight,
    this.fat,
    required this.heightFeet,
    required this.heightInches,
    this.chest,
    this.waist,
    this.arms,
    required this.image,
    required this.clientSource,
    required this.maritalStatus,
    this.anniversary,
    this.occupation,
    this.occupationDetails,
    this.resetPasswordToken,
    required this.createdAt,
    required this.updatedAt,
    required this.detailId,
  });
  late final int id;
  late final Null personnelId;
  late final String firstName;
  late final Null middleName;
  late final String lastName;
  late final String dob;
  late final String gender;
  late final String email;
  late final String address;
  late final String mobile;
  late final String joiningDate;
  late final Null weight;
  late final Null fat;
  late final int heightFeet;
  late final int heightInches;
  late final Null chest;
  late final Null waist;
  late final Null arms;
  late final String image;
  late final String clientSource;
  late final String maritalStatus;
  late final Null anniversary;
  late final Null occupation;
  late final Null occupationDetails;
  late final Null resetPasswordToken;
  late final String createdAt;
  late final String updatedAt;
  late final int detailId;

  CustomerValues.fromJson(Map<String, dynamic> json){
    id = json['id'];
    personnelId = null;
    firstName = json['first_name'];
    middleName = null;
    lastName = json['last_name'];
    dob = json['dob'];
    gender = json['gender'];
    email = json['email'];
    address = json['address'];
    mobile = json['mobile'];
    joiningDate = json['joining_date'];
    weight = null;
    fat = null;
    heightFeet = json['height_feet'];
    heightInches = json['height_inches'];
    chest = null;
    waist = null;
    arms = null;
    image = json['image'];
    clientSource = json['client_source'];
    maritalStatus = json['marital_status'];
    anniversary = null;
    occupation = null;
    occupationDetails = null;
    resetPasswordToken = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detailId = json['detail_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['personnel_id'] = personnelId;
    _data['first_name'] = firstName;
    _data['middle_name'] = middleName;
    _data['last_name'] = lastName;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['address'] = address;
    _data['mobile'] = mobile;
    _data['joining_date'] = joiningDate;
    _data['weight'] = weight;
    _data['fat'] = fat;
    _data['height_feet'] = heightFeet;
    _data['height_inches'] = heightInches;
    _data['chest'] = chest;
    _data['waist'] = waist;
    _data['arms'] = arms;
    _data['image'] = image;
    _data['client_source'] = clientSource;
    _data['marital_status'] = maritalStatus;
    _data['anniversary'] = anniversary;
    _data['occupation'] = occupation;
    _data['occupation_details'] = occupationDetails;
    _data['reset_password_token'] = resetPasswordToken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['detail_id'] = detailId;
    return _data;
  }
}

class CustomerBusiness {
  CustomerBusiness({
    required this.id,
    required this.detailId,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int detailId;
  late final int customerId;
  late final String createdAt;
  late final String updatedAt;

  CustomerBusiness.fromJson(Map<String, dynamic> json){
    id = json['id'];
    detailId = json['detail_id'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['detail_id'] = detailId;
    _data['customer_id'] = customerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class GymSettings {
  GymSettings({
    required this.id,
    required this.detailId,
    required this.currencyId,
    required this.image,
    required this.frontImage,
    required this.customerLogo,
    required this.gstin,
    this.mailDriver,
    this.mailHost,
    this.mailPort,
    this.mailUsername,
    this.mailPassword,
    this.mailEncryption,
    required this.emailStatus,
    this.mailName,
    this.mailEmail,
    required this.paymentStatus,
    this.esewaMerchantId,
    this.khaltiPublicKey,
    this.khaltiSecretKey,
    required this.offlineText,
    required this.localStorage,
    this.fileStorage,
    this.awsKey,
    this.awsSecret,
    this.awsRegion,
    this.awsBucket,
    required this.smsStatus,
    required this.smsApiUrl,
    required this.smsSenderId,
    required this.smsUsername,
    required this.smsPassword,
    this.mapsApiKey,
    this.idleTime,
    this.about,
    this.fbUrl,
    this.twitterUrl,
    this.googleUrl,
    this.youtubeUrl,
    this.contactMail,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int detailId;
  late final int currencyId;
  late final String image;
  late final String frontImage;
  late final String customerLogo;
  late final String gstin;
  late final Null mailDriver;
  late final Null mailHost;
  late final Null mailPort;
  late final Null mailUsername;
  late final Null mailPassword;
  late final Null mailEncryption;
  late final String emailStatus;
  late final Null mailName;
  late final Null mailEmail;
  late final String paymentStatus;
  late final Null esewaMerchantId;
  late final Null khaltiPublicKey;
  late final Null khaltiSecretKey;
  late final String offlineText;
  late final int localStorage;
  late final Null fileStorage;
  late final Null awsKey;
  late final Null awsSecret;
  late final Null awsRegion;
  late final Null awsBucket;
  late final String smsStatus;
  late final String smsApiUrl;
  late final String smsSenderId;
  late final String smsUsername;
  late final String smsPassword;
  late final Null mapsApiKey;
  late final Null idleTime;
  late final Null about;
  late final Null fbUrl;
  late final Null twitterUrl;
  late final Null googleUrl;
  late final Null youtubeUrl;
  late final Null contactMail;
  late final String createdAt;
  late final String updatedAt;

  GymSettings.fromJson(Map<String, dynamic> json){
    id = json['id'];
    detailId = json['detail_id'];
    currencyId = json['currency_id'];
    image = json['image'];
    frontImage = json['front_image'];
    customerLogo = json['customer_logo'];
    gstin = json['gstin'];
    mailDriver = null;
    mailHost = null;
    mailPort = null;
    mailUsername = null;
    mailPassword = null;
    mailEncryption = null;
    emailStatus = json['email_status'];
    mailName = null;
    mailEmail = null;
    paymentStatus = json['payment_status'];
    esewaMerchantId = null;
    khaltiPublicKey = null;
    khaltiSecretKey = null;
    offlineText = json['offline_text'];
    localStorage = json['local_storage'];
    fileStorage = null;
    awsKey = null;
    awsSecret = null;
    awsRegion = null;
    awsBucket = null;
    smsStatus = json['sms_status'];
    smsApiUrl = json['sms_api_url'];
    smsSenderId = json['sms_sender_id'];
    smsUsername = json['sms_username'];
    smsPassword = json['sms_password'];
    mapsApiKey = null;
    idleTime = null;
    about = null;
    fbUrl = null;
    twitterUrl = null;
    googleUrl = null;
    youtubeUrl = null;
    contactMail = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['detail_id'] = detailId;
    _data['currency_id'] = currencyId;
    _data['image'] = image;
    _data['front_image'] = frontImage;
    _data['customer_logo'] = customerLogo;
    _data['gstin'] = gstin;
    _data['mail_driver'] = mailDriver;
    _data['mail_host'] = mailHost;
    _data['mail_port'] = mailPort;
    _data['mail_username'] = mailUsername;
    _data['mail_password'] = mailPassword;
    _data['mail_encryption'] = mailEncryption;
    _data['email_status'] = emailStatus;
    _data['mail_name'] = mailName;
    _data['mail_email'] = mailEmail;
    _data['payment_status'] = paymentStatus;
    _data['esewa_merchant_id'] = esewaMerchantId;
    _data['khalti_public_key'] = khaltiPublicKey;
    _data['khalti_secret_key'] = khaltiSecretKey;
    _data['offline_text'] = offlineText;
    _data['local_storage'] = localStorage;
    _data['file_storage'] = fileStorage;
    _data['aws_key'] = awsKey;
    _data['aws_secret'] = awsSecret;
    _data['aws_region'] = awsRegion;
    _data['aws_bucket'] = awsBucket;
    _data['sms_status'] = smsStatus;
    _data['sms_api_url'] = smsApiUrl;
    _data['sms_sender_id'] = smsSenderId;
    _data['sms_username'] = smsUsername;
    _data['sms_password'] = smsPassword;
    _data['maps_api_key'] = mapsApiKey;
    _data['idle_time'] = idleTime;
    _data['about'] = about;
    _data['fb_url'] = fbUrl;
    _data['twitter_url'] = twitterUrl;
    _data['google_url'] = googleUrl;
    _data['youtube_url'] = youtubeUrl;
    _data['contact_mail'] = contactMail;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Notifications {
  Notifications({
    required this.customerId,
    required this.notificationType,
    required this.title,
  });
  late final int customerId;
  late final String notificationType;
  late final String title;

  Notifications.fromJson(Map<String, dynamic> json){
    customerId = json['customer_id'];
    notificationType = json['notification_type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customer_id'] = customerId;
    _data['notification_type'] = notificationType;
    _data['title'] = title;
    return _data;
  }
}

class ExpiringSubscriptions {
  ExpiringSubscriptions({
    required this.firstName,
    required this.lastName,
    required this.startDate,
    required this.expiresOn,
    required this.membership,
    required this.id,
  });
  late final String firstName;
  late final String lastName;
  late final String startDate;
  late final String expiresOn;
  late final String membership;
  late final int id;

  ExpiringSubscriptions.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    startDate = json['start_date'];
    expiresOn = json['expires_on'];
    membership = json['membership'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['start_date'] = startDate;
    _data['expires_on'] = expiresOn;
    _data['membership'] = membership;
    _data['id'] = id;
    return _data;
  }
}

class DuePayments {
  DuePayments({
    required this.firstName,
    required this.lastName,
    required this.amountToBePaid,
    required this.paid,
    required this.dueDate,
    required this.membership,
    required this.id,
  });
  late final String firstName;
  late final String lastName;
  late final int amountToBePaid;
  late final int paid;
  late final String dueDate;
  late final String membership;
  late final int id;

  DuePayments.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    amountToBePaid = json['amount_to_be_paid'];
    paid = json['paid'];
    dueDate = json['due_date'];
    membership = json['membership'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['amount_to_be_paid'] = amountToBePaid;
    _data['paid'] = paid;
    _data['due_date'] = dueDate;
    _data['membership'] = membership;
    _data['id'] = id;
    return _data;
  }
}

class PaymentCharts {
  PaymentCharts({
    required this.S,
    required this.M,
  });
  late final String S;
  late final int M;

  PaymentCharts.fromJson(Map<String, dynamic> json){
    S = json['S'];
    M = json['M'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['S'] = S;
    _data['M'] = M;
    return _data;
  }
}

class DefaultDietPlan {
  DefaultDietPlan({
    required this.id,
    this.clientId,
    required this.branchId,
    required this.days,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final Null clientId;
  late final int branchId;
  late final String days;
  late final String breakfast;
  late final String lunch;
  late final String dinner;
  late final String createdAt;
  late final String updatedAt;

  DefaultDietPlan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    clientId = null;
    branchId = json['branch_id'];
    days = json['days'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['client_id'] = clientId;
    _data['branch_id'] = branchId;
    _data['days'] = days;
    _data['breakfast'] = breakfast;
    _data['lunch'] = lunch;
    _data['dinner'] = dinner;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ClientDietPlan {
  ClientDietPlan({
    required this.id,
    required this.clientId,
    required this.branchId,
    required this.days,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int clientId;
  late final int branchId;
  late final String days;
  late final String breakfast;
  late final String lunch;
  late final String dinner;
  late final String createdAt;
  late final String updatedAt;

  ClientDietPlan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    clientId = json['client_id'];
    branchId = json['branch_id'];
    days = json['days'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['client_id'] = clientId;
    _data['branch_id'] = branchId;
    _data['days'] = days;
    _data['breakfast'] = breakfast;
    _data['lunch'] = lunch;
    _data['dinner'] = dinner;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class DefaultTrainingPlan {
  DefaultTrainingPlan({
    required this.id,
    this.clientId,
    required this.branchId,
    required this.days,
    required this.level,
    required this.activity,
    required this.sets,
    required this.repetition,
    required this.weights,
    required this.restTime,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final Null clientId;
  late final int branchId;
  late final String days;
  late final String level;
  late final String activity;
  late final String sets;
  late final String repetition;
  late final String weights;
  late final String restTime;
  late final String startDate;
  late final String endDate;
  late final String createdAt;
  late final String updatedAt;

  DefaultTrainingPlan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    clientId = null;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['client_id'] = clientId;
    _data['branch_id'] = branchId;
    _data['days'] = days;
    _data['level'] = level;
    _data['activity'] = activity;
    _data['sets'] = sets;
    _data['repetition'] = repetition;
    _data['weights'] = weights;
    _data['restTime'] = restTime;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ClientTrainingPlan {
  ClientTrainingPlan({
    required this.id,
    required this.clientId,
    required this.branchId,
    required this.days,
    required this.level,
    required this.activity,
    required this.sets,
    required this.repetition,
    required this.weights,
    required this.restTime,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int clientId;
  late final int branchId;
  late final String days;
  late final String level;
  late final String activity;
  late final String sets;
  late final String repetition;
  late final String weights;
  late final String restTime;
  late final String startDate;
  late final String endDate;
  late final String createdAt;
  late final String updatedAt;

  ClientTrainingPlan.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['client_id'] = clientId;
    _data['branch_id'] = branchId;
    _data['days'] = days;
    _data['level'] = level;
    _data['activity'] = activity;
    _data['sets'] = sets;
    _data['repetition'] = repetition;
    _data['weights'] = weights;
    _data['restTime'] = restTime;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ClassSchedule {
  ClassSchedule({
    required this.id,
    required this.branchId,
    required this.className,
    required this.trainer,
    required this.days,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int branchId;
  late final String className;
  late final String trainer;
  late final String days;
  late final String startTime;
  late final String endTime;
  late final String createdAt;
  late final String updatedAt;

  ClassSchedule.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['branch_id'] = branchId;
    _data['className'] = className;
    _data['trainer'] = trainer;
    _data['days'] = days;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}