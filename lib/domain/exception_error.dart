class ExceptionError {
  int? status;
  String? message;
  bool? isSuccess;

  ExceptionError({
    this.status = 200,
    this.message = "Success",
    this.isSuccess = true,
  });
}
