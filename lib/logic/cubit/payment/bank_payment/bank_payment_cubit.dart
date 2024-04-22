import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/model/auth/auth_error_model.dart';
import '../../../../presentation/error/failure.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../repository/payment_repository.dart';

part 'bank_payment_state.dart';

class BankPaymentCubit extends Cubit<BankPaymentState> {
  final LoginBloc _loginBloc;
  final PaymentRepository _paymentRepository;

  BankPaymentCubit(
      {required LoginBloc loginBloc,
      required PaymentRepository paymentRepository})
      : _paymentRepository = paymentRepository,
        _loginBloc = loginBloc,
        super(BankPaymentInitial());

  Future<void> bankPayment(Map<String, String> body, String planSlug) async {
    emit(BankPaymentLoading());
    final result = await _paymentRepository.bankPayment(
        _loginBloc.userInfo!.tokenModel.accessToken, planSlug, body);
    result.fold((failure) {
      if (failure is InvalidAuthData) {
        final errors = BankPaymentFormError(failure.errors);
        emit(errors);
      } else {
        final errors = BankPaymentError(failure.message, failure.statusCode);
        emit(errors);
      }
    }, (success) {
      emit(BankPaymentLoaded(success));
    });
  }
}
