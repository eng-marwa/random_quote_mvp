class ApiException {
  final int code;
  final String message;

  ApiException(this.code, this.message);

  factory ApiException.fromJson(Map<String, dynamic> json) {
    return ApiException(json['statusCode'], json['statusMessage']);
  }
}
