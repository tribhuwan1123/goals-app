class Profile {
  bool? success;
  Data? data;
  String? message;

  Profile({this.success, this.data, this.message});

  Profile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  dynamic? personnelId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dob;
  String? gender;
  String? email;
  dynamic? address;
  String? mobile;
  String? joiningDate;
  dynamic? weight;
  dynamic? fat;
  dynamic? heightFeet;
  dynamic? heightInches;
  dynamic? chest;
  dynamic? waist;
  dynamic? arms;
  String? image;
  String? clientSource;
  String? maritalStatus;
  dynamic? anniversary;
  dynamic? occupation;
  dynamic? occupationDetails;
  dynamic? resetPasswordToken;
  String? createdAt;
  String? updatedAt;

  Data(
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
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['personnel_id'] = this.personnelId;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['joining_date'] = this.joiningDate;
    data['weight'] = this.weight;
    data['fat'] = this.fat;
    data['height_feet'] = this.heightFeet;
    data['height_inches'] = this.heightInches;
    data['chest'] = this.chest;
    data['waist'] = this.waist;
    data['arms'] = this.arms;
    data['image'] = this.image;
    data['client_source'] = this.clientSource;
    data['marital_status'] = this.maritalStatus;
    data['anniversary'] = this.anniversary;
    data['occupation'] = this.occupation;
    data['occupation_details'] = this.occupationDetails;
    data['reset_password_token'] = this.resetPasswordToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}