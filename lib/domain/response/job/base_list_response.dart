class BaseListResponse<T> {
  List<T>? data;
  int? status;
  String? message;

  BaseListResponse({
    this.data,
    this.message,
    this.status,
  });
}
