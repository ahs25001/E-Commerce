part of 'edite_password_bloc.dart';

@immutable
abstract class EditePasswordEvent {}

class ShowCurrentPasswordEvent extends EditePasswordEvent {}

class ShowNewPasswordEvent extends EditePasswordEvent {}

class ShowRePasswordEvent extends EditePasswordEvent {}

class DoNotShowCurrentPasswordEvent extends EditePasswordEvent {}

class DoNotShowNewPasswordEvent extends EditePasswordEvent {}

class DoNotShowRePasswordEvent extends EditePasswordEvent {}

class SaveChangedPasswordEvent extends EditePasswordEvent {
  String currentPassword;
  String newPassword;
  String rePassword;

  SaveChangedPasswordEvent(
      {required this.currentPassword,
      required this.newPassword,
      required this.rePassword});
}
