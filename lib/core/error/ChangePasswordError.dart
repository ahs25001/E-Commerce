class ChangePasswordError {
  ChangePasswordError({
      this.statusMsg, 
      this.message,});

  ChangePasswordError.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }
  String? statusMsg;
  String? message;


}