class MerchantInfo {
  Data? data;

  MerchantInfo({this.data});

  MerchantInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  MobileAppInfo? mobileAppInfo;
  CommonDetails? commonDetails;

  Data({this.mobileAppInfo, this.commonDetails});

  Data.fromJson(Map<String, dynamic> json) {
    mobileAppInfo = json['mobileAppInfo'] != null
        ? new MobileAppInfo.fromJson(json['mobileAppInfo'])
        : null;
    commonDetails = json['common_details'] != null
        ? new CommonDetails.fromJson(json['common_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mobileAppInfo != null) {
      data['mobileAppInfo'] = this.mobileAppInfo!.toJson();
    }
    if (this.commonDetails != null) {
      data['common_details'] = this.commonDetails!.toJson();
    }
    return data;
  }
}

class MobileAppInfo {
  int? id;
  int? detailId;
  String? about;
  String? services;
  String? pricePlan;
  String? logo;
  String? offerImage;
  String? bannerImage1;
  String? bannerImage2;
  String? bannerImage3;
  String? address;
  String? fbUrl;
  String? googleUrl;
  String? twitterUrl;
  String? youtubeUrl;
  String? contactMail;
  String? createdAt;
  String? updatedAt;

  MobileAppInfo(
      {this.id,
        this.detailId,
        this.about,
        this.services,
        this.pricePlan,
        this.logo,
        this.offerImage,
        this.bannerImage1,
        this.bannerImage2,
        this.bannerImage3,
        this.address,
        this.fbUrl,
        this.googleUrl,
        this.twitterUrl,
        this.youtubeUrl,
        this.contactMail,
        this.createdAt,
        this.updatedAt});

  MobileAppInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detailId = json['detail_id'];
    about = json['about'];
    services = json['services'];
    pricePlan = json['price_plan'];
    logo = json['logo'];
    offerImage = json['offer_image'];
    bannerImage1 = json['banner_image1'];
    bannerImage2 = json['banner_image2'];
    bannerImage3 = json['banner_image3'];
    address = json['address'];
    fbUrl = json['fb_url'];
    googleUrl = json['google_url'];
    twitterUrl = json['twitter_url'];
    youtubeUrl = json['youtube_url'];
    contactMail = json['contact_mail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['detail_id'] = this.detailId;
    data['about'] = this.about;
    data['services'] = this.services;
    data['price_plan'] = this.pricePlan;
    data['logo'] = this.logo;
    data['offer_image'] = this.offerImage;
    data['banner_image1'] = this.bannerImage1;
    data['banner_image2'] = this.bannerImage2;
    data['banner_image3'] = this.bannerImage3;
    data['address'] = this.address;
    data['fb_url'] = this.fbUrl;
    data['google_url'] = this.googleUrl;
    data['twitter_url'] = this.twitterUrl;
    data['youtube_url'] = this.youtubeUrl;
    data['contact_mail'] = this.contactMail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CommonDetails {
  int? id;
  String? title;
  String? address;
  Null? longitude;
  Null? latitude;
  String? slug;
  String? ownerInchargeName;
  String? phone;
  Null? ownerInchargeName2;
  Null? phone2;
  String? email;
  Null? website;
  Null? bitlyLink;
  Null? searchTitle;
  String? status;
  String? startDate;
  String? endDate;
  Null? lastUpdated;
  String? createdAt;
  String? updatedAt;

  CommonDetails(
      {this.id,
        this.title,
        this.address,
        this.longitude,
        this.latitude,
        this.slug,
        this.ownerInchargeName,
        this.phone,
        this.ownerInchargeName2,
        this.phone2,
        this.email,
        this.website,
        this.bitlyLink,
        this.searchTitle,
        this.status,
        this.startDate,
        this.endDate,
        this.lastUpdated,
        this.createdAt,
        this.updatedAt});

  CommonDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    slug = json['slug'];
    ownerInchargeName = json['owner_incharge_name'];
    phone = json['phone'];
    ownerInchargeName2 = json['owner_incharge_name2'];
    phone2 = json['phone2'];
    email = json['email'];
    website = json['website'];
    bitlyLink = json['bitly_link'];
    searchTitle = json['search_title'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    lastUpdated = json['last_updated'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['slug'] = this.slug;
    data['owner_incharge_name'] = this.ownerInchargeName;
    data['phone'] = this.phone;
    data['owner_incharge_name2'] = this.ownerInchargeName2;
    data['phone2'] = this.phone2;
    data['email'] = this.email;
    data['website'] = this.website;
    data['bitly_link'] = this.bitlyLink;
    data['search_title'] = this.searchTitle;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['last_updated'] = this.lastUpdated;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}