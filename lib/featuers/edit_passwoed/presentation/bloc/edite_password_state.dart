part of 'edite_password_bloc.dart';

enum EditePasswordScreenStatus {
  loading,
  showCurrentPassword,
  showNewPassword,
  showRePassword,
  doNotShowCurrentPassword,
  doNotShowNewPassword,
  doNotShowRePassword,
  passwordChangedSuccess,
  passwordChangedFulled,
  init
}

@immutable
class EditePasswordState {
  EditePasswordScreenStatus? editePasswordScreenStatus;
  Failures? failures;

  EditePasswordState({this.editePasswordScreenStatus, this.failures});

  EditePasswordState copyhWith(
      {EditePasswordScreenStatus? editePasswordScreenStatus,
      Failures? failures}) {
    return EditePasswordState(
        editePasswordScreenStatus:
            editePasswordScreenStatus ?? this.editePasswordScreenStatus,
        failures: failures ?? this.failures);
  }
}

class EditePasswordInitial extends EditePasswordState {
  EditePasswordInitial()
      : super(editePasswordScreenStatus: EditePasswordScreenStatus.init);
}
