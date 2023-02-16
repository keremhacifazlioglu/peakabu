class ExceptionError {
  int? status;
  String? message;

  ExceptionError({
    this.status = 200,
    this.message = "Success",
  });

/*
  ExceptionError.fromJson(Map<String, dynamic> json) {
    status = json['status'] as int?;
    message = json['message'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    return json;
  }*/
}
