part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonEvent extends LoginEvent {
  String userName;
  String password;

  LoginButtonEvent({required this.userName, required this.password});
}

class ShowPasswordLoginButtonEvent extends LoginEvent {}
