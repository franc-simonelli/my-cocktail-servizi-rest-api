class ResponseBase {
  String data;
  bool success;
  String errorMessage;

  ResponseBase({this.data = "", this.success = true, this.errorMessage = ""});
}
