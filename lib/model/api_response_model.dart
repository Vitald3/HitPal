class ApiResponseModel {
  String? message;
  int? code;
  late final bool status;
  String? token;

  ApiResponseModel({
    this.message,
    this.code,
    required this.status,
    this.token
  });

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'] ?? 200;
    status = json['status'];
    token = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    data['data'] = token;
    return data;
  }
}