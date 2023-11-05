
import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/login/data/data_sources/remot/login_ds.dart';
import 'package:e_commerce/featuers/login/data/data_sources/remot/login_ds_impl.dart';
import 'package:e_commerce/featuers/login/data/models/request_data.dart';
import 'package:e_commerce/featuers/login/data/repositories/login_repo_impl.dart';
import 'package:e_commerce/featuers/login/domain/repositories/login_repo.dart';
import 'package:e_commerce/featuers/login/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';
import 'package:e_commerce/featuers/sinUp/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context)=>BlocProvider.of(context);
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        LoginDataSource loginDataSource = LoginDataSourceImpl(apiManager);
        LoginRepo loginRepo = LoginRepoImpl(loginDataSource);
        LoginUseCase loginUseCase = LoginUseCase(loginRepo);
        LoginRequestData loginRequestData =
            LoginRequestData(email: "ahsn2514@gmail.com", password: "password");
        var result = await loginUseCase.call(loginRequestData);
        result.fold((l) {
          emit(state.copyWith(
              userEntity: l, screenStatus: ScreenStatus.successfully));
        }, (r) {
          emit(
              state.copyWith(failures: r, screenStatus: ScreenStatus.failures));
        });
      }
    });
  }
}
