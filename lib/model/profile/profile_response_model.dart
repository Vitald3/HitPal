class ProfileResponseModel {
  String? firstName;
  String? lastName;
  String? location;
  String? avatar;

  ProfileResponseModel({
    this.firstName,
    this.lastName,
    this.location,
    this.avatar
  });

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    location = json['location'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['location'] = location;
    data['avatar'] = avatar;
    return data;
  }
}