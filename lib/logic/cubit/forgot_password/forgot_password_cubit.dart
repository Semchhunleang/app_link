import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/auth/auth_error_model.dart';
import '../../../data/model/auth/set_password_model.dart';
import '../../../presentation/error/failure.dart';
import '../../repository/auth_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository repository;
  // final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final codeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  ForgotPasswordCubit(this.repository)
      : super(const ForgotPasswordStateInitial());

  Future<void> forgotPassWord() async {
    emit(const ForgotPasswordStateLoading());
    final body = {"email": emailController.text.trim()};
    final result = await repository.sendForgotPassCode(body);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          emit(ForgotPasswordFormValidateError(failure.errors));
        } else {
          emit(ForgotPasswordStateError(failure.message));
        }
      },
      (data) {
        emit(ForgotPasswordStateLoaded(data));
      },
    );
  }

  //--------- verify forgot password with new api -------
  Future<void> verifyForgotPassword() async {
    debugPrint("-- verify forgot password 1");
    emit(const ForgotPasswordStateLoading());
    debugPrint("-- verify forgot password 2");
    final body = {"phone": phoneNumberController.text.trim()};
    debugPrint("-- verify forgot password 3 : $body");
    print('model $body');

    final result = await repository.verifyForgotPassword(body);
    debugPrint("-- verify forgot password 4 : $result");
    result.fold(
      (failure) {
        debugPrint("-- verify forgot password 5");
        if (failure is InvalidAuthData) {
          emit(ForgotPasswordFormValidateError(failure.errors));
        } else {
          emit(ForgotPasswordStateError(failure.message));
        }
      },
      (data) {
        debugPrint("-- verify forgot password 6");
        emit(PasswordSetStateLoaded(data));
      },
    );
  }

  // Future<void> setNewPassword() async {
  //   emit(const ForgotPasswordStateLoading());
  //   if (passwordConfirmController.text.isEmpty &&
  //       (!passwordConfirmController.text.contains(passwordController.text))) {
  //     emit(const ForgotPasswordStateError('Confirm password doesn\'t match'));
  //   } else {
  //     final model = SetPasswordModel(
  //       code: codeController.text,
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //       passwordConfirmation: passwordController.text.trim(),
  //     );
  //     print('model $model');

  //     final result = await repository.setPassword(model);
  //     result.fold(
  //       (failure) {
  //         if (failure is InvalidAuthData) {
  //           emit(ForgotPasswordFormValidateError(failure.errors));
  //         } else {
  //           emit(ForgotPasswordStateError(failure.message));
  //         }
  //       },
  //       (data) {
  //         emit(PasswordSetStateLoaded(data));
  //       },
  //     );
  //   }
  // }

  Future<void> verifyForgotPasswordCode() async {
    emit(const ForgotPasswordStateLoading());
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        emit(const VerifyingForgotPasswordCodeLoaded());
      },
    );
  }
}
