part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class RegisterEvent extends SignUpEvent {
  String name;
  String email;
  String phone;
  String password;
  String rePassword;

  RegisterEvent(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.rePassword});
}
class ShowPasswordSignButtonEvent extends SignUpEvent {}

