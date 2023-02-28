class BaseListResponse<T> {
  List<T>? data;
  int? status;
  String? message;
  bool? isSuccess;

  BaseListResponse({
    this.data,
    this.message,
    this.status,
    this.isSuccess = true,
  });
}
