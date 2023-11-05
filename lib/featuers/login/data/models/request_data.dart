class LoginRequestData{
  String email;
  String password;

  LoginRequestData({required this.email, required this.password});
  Map<String,dynamic>toJson(){
    return {
      "email":email,
      "password":password
    };
  }
}