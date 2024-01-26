import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/local/change_password_lds.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/local/change_password_lds_impl.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/remot/change_password_ds.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/remot/change_password_ds_impl.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/repositories/change_password_repo_impl.dart';
import 'package:e_commerce/featuers/edit_passwoed/domain/repositories/change_password_repo.dart';
import 'package:e_commerce/featuers/edit_passwoed/domain/use_cases/change_password_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failuers.dart';

part 'edite_password_event.dart';
part 'edite_password_state.dart';

class EditePasswordBloc extends Bloc<EditePasswordEvent, EditePasswordState> {
  static EditePasswordBloc get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  EditePasswordBloc() : super(EditePasswordInitial()) {
    on<EditePasswordEvent>((event, emit) async {
      if (event is ShowNewPasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus:
                EditePasswordScreenStatus.showNewPassword));
      } else if (event is ShowRePasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus:
                EditePasswordScreenStatus.showRePassword));
      } else if (event is ShowCurrentPasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus:
                EditePasswordScreenStatus.showCurrentPassword));
      } else if (event is DoNotShowCurrentPasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus:
                EditePasswordScreenStatus.doNotShowCurrentPassword));
      } else if (event is DoNotShowNewPasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus:
                EditePasswordScreenStatus.doNotShowNewPassword));
      } else if (event is DoNotShowRePasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus:
                EditePasswordScreenStatus.doNotShowRePassword));
      } else if (event is SaveChangedPasswordEvent) {
        emit(state.copyhWith(
            editePasswordScreenStatus: EditePasswordScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        ChangePasswordDS changePasswordDS = ChangePasswordDsImpl(apiManager);
        ChangePasswordRepo changePasswordRepo =
            ChangePasswordRepoImpl(changePasswordDS);
        ChangePasswordUseCase changePasswordUseCase =
            ChangePasswordUseCase(changePasswordRepo);
        var response = await changePasswordUseCase.call(
            currentPassword: event.currentPassword,
            newPassword: event.newPassword,
            rePassword: event.rePassword);
        response.fold((l) {
          ChangePasswordLDS changePasswordLDS = ChangePasswordLDSImpl();
          changePasswordLDS.removeToken();
          emit(state.copyhWith(
              editePasswordScreenStatus:
                  EditePasswordScreenStatus.passwordChangedSuccess));
        }, (r) {
          emit(state.copyhWith(
              editePasswordScreenStatus:
                  EditePasswordScreenStatus.passwordChangedFulled,
              failures: r));
        });
      }
    });
  }
}
