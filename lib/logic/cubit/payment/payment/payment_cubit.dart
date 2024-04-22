import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/payment/payment_model.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../repository/payment_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _paymentRepository;
  final LoginBloc _loginBloc;

  PaymentCubit(
      {required PaymentRepository paymentRepository,
      required LoginBloc loginBloc})
      : _paymentRepository = paymentRepository,
        _loginBloc = loginBloc,
        super(PaymentInitial());

  PaymentModel? payment;

  Future<void> getPaymentPageInformation(String planSlug) async {
    emit(PaymentStatePageInfoLoading());
    final result = await _paymentRepository.getPaymentPageInformation(
        _loginBloc.userInfo!.tokenModel.accessToken, planSlug);
    result.fold((failure) {
      emit(PaymentStatePageInfoError(failure.message, failure.statusCode));
    }, (success) {
      payment = success;
      emit(PaymentStatePageInfoLoaded(success));
    });
  }

  Future<void> freeEnrollment(String planSlug) async {
    emit(PaymentStateEnrollLoading());
    final result = await _paymentRepository.freeEnrollment(
        _loginBloc.userInfo!.tokenModel.accessToken, planSlug);
    result.fold((failure) {
      emit(PaymentStateEnrollError(failure.message, failure.statusCode));
    }, (success) {
      emit(PaymentStateEnrollLoaded(success));
    });
  }
}
