import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/sinUp/data/data_sources/remot/remot_ds_impl.dart';
import 'package:e_commerce/featuers/sinUp/data/data_sources/remot/remote_ds.dart';
import 'package:e_commerce/featuers/sinUp/data/models/request_data.dart';
import 'package:e_commerce/featuers/sinUp/data/repositories/sign_up_repo_impl.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';
import 'package:e_commerce/featuers/sinUp/domain/repositories/sgin_up_repo.dart';
import 'package:e_commerce/featuers/sinUp/domain/use_cases/sgin_up_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(context) => BlocProvider.of(context);

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        RemoteDataSource remoteDataSource = RemoteDataSourceImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(remoteDataSource);
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);
        SignUpRequestData requestData = SignUpRequestData(
            name: "name",
            email: "ahsn2514@gmail.com",
            password: "password",
            rePassword: "password",
            phone: "01203682237");

        var result = await signUpUseCase.call(requestData);
        result.fold((l) {
          emit(state.copyWith(
              userEntity: l, screenStatus: ScreenStatus.successfully));
        }, (r) {
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: r));
        });
      }
    });
  }
}
