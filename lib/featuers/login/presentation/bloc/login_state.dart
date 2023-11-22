part of 'login_bloc.dart';

class LoginState {
  final Failures? failures;
  final UserEntity? userEntity;
  final ScreenStatus? screenStatus;

  LoginState({
    this.failures,
    this.userEntity,
    this.screenStatus,
  });

  LoginState copyWith({
    Failures? failures,
    UserEntity? userEntity,
    ScreenStatus? screenStatus,
  }) {
    return LoginState(
      screenStatus: screenStatus ?? this.screenStatus,
      failures: failures ?? this.failures,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}

class LoginInitial extends LoginState {
  LoginInitial() : super(screenStatus: ScreenStatus.init);
}
