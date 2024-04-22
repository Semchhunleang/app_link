import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/logic/cubit/payment_online/product/subscription_product_state.dart';

import '../../../../data/model/online_payment/product_payment_model.dart';
import '../../../../state_inject_package_names.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../repository/payment_online_repository.dart';

class SubscriptionProductCubit extends Cubit<SubscriptionProductState> {
  final PaymentOnlineRepository _paymentOnlineRepository;
  final LoginBloc _loginBloc;

  SubscriptionProductCubit(
      {required PaymentOnlineRepository paymentOnlineRepository,
      required LoginBloc loginBloc})
      : _paymentOnlineRepository = paymentOnlineRepository,
        _loginBloc = loginBloc,
        super(SubscriptionProductInitial());

  //       List<ProductPaymentModel> productPlan = [];
  // Future<void> getPricePlan() async {
  //     debugPrint("------- get product before loading------");
  //   emit(SubscriptionProductLoading());
  //    debugPrint("------- get product is loading------");
  //   final result = await _paymentOnlineRepository.getProduct(_loginBloc.userInfo!.tokenModel.accessToken);
  //    debugPrint("------- get product result :$result------");
  //   result.fold((failure) {
  //     emit(SubscriptionProductError(failure.message, failure.statusCode));
  //   }, (success) {

  //     productPlan = success;
  //      debugPrint("------- get product put into model :$productPlan------");
  //     emit(SubscriptionProductLoaded(success));
  //   });
  // }

  ProductPaymentModel? productPayment;

  Future<void> getProduct(String group) async {
    debugPrint("------- get product before loading------");
    emit(SubscriptionProductLoading());
    debugPrint("------- get product is loading------");
    final result = await _paymentOnlineRepository.getProduct(
        _loginBloc.userInfo!.tokenModel.accessToken, group);
    debugPrint("------- get product result :$result------");
    result.fold((l) => emit(SubscriptionProductError(l.message, l.statusCode)),
        (r) {
      productPayment = r;
      debugPrint("------- get product put into model :$productPayment------");
      emit(SubscriptionProductLoaded(r));
      debugPrint("------- get product end------");
    });
  }
}
