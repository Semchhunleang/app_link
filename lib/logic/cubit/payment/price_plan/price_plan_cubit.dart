import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/model/payment/pricing_plan_model.dart';
import '../../../repository/payment_repository.dart';

part 'price_plan_state.dart';

class PricePlanCubit extends Cubit<PricePlanState> {
  final PaymentRepository _paymentRepository;

  PricePlanCubit({required PaymentRepository paymentRepository})
      : _paymentRepository = paymentRepository,
        super(PricePlanInitial());
  List<PricePlan> pricePlan = [];
  Future<void> getPricePlan() async {
    emit(PricePlanLoading());
    final result = await _paymentRepository.getPricePlan();
    result.fold((failure) {
      emit(PricePlanError(failure.message, failure.statusCode));
    }, (success) {
      pricePlan = success;
      emit(PricePlanLoaded(success));
    });
  }
}
