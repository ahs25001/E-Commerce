import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/login/data/models/request_data.dart';
import 'package:e_commerce/featuers/login/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';
import 'package:e_commerce/featuers/sinUp/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';

part 'login_state.dart';
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  static LoginBloc get(context) => BlocProvider.of(context);

  TextEditingController emilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        LoginRequestData loginRequestData = LoginRequestData(
            email: emilController.text, password: passwordController.text);
        var result = await loginUseCase.call(loginRequestData);
        result.fold((l) {
          emit(state.copyWith(
              userEntity: l, screenStatus: ScreenStatus.successfully));
        }, (r) {
          emit(
              state.copyWith(failures: r, screenStatus: ScreenStatus.failures));
        });
      } else if (event is ShowPasswordLoginButtonEvent &&
          state.screenStatus != ScreenStatus.showPassword) {
        emit(state.copyWith(
          screenStatus: ScreenStatus.showPassword,
        ));
      } else if (event is ShowPasswordLoginButtonEvent &&
          state.screenStatus == ScreenStatus.showPassword) {
        emit(state.copyWith(
          screenStatus: ScreenStatus.init,
        ));
      }
    });
  }
}
