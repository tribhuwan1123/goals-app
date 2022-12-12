class AttendanceResponse {
  List<Attendance>? attendance;

  AttendanceResponse({this.attendance});

  AttendanceResponse.fromJson(Map<String, dynamic> json) {
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (attendance != null) {
      data['attendance'] = attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendance {
  int? id;
  int? clientId;
  String? checkIn;
  String? checkOut;
  String? status;
  String? createdAt;
  String? updatedAt;

  Attendance(
      {this.id,
        this.clientId,
        this.checkIn,
        this.checkOut,
        this.status,
        this.createdAt,
        this.updatedAt});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['client_id'] = clientId;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
