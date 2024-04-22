import 'package:real_estate/logic/cubit/payment_online/payment_plan/submit_payment_link_state.dart';
import '../../../../data/model/online_payment/payment_link_success_model.dart';
import '../../../../presentation/error/failure.dart';
import '../../../../state_inject_package_names.dart';

class SubmitPaymentLinkCubit extends Cubit<SubmitPaymentLinkState> {
  final PaymentOnlineRepository _paymentOnlineRepository;
  final LoginBloc _loginBloc;

  SubmitPaymentLinkCubit(
      {required PaymentOnlineRepository paymentOnlineRepository,
      required LoginBloc loginBloc})
      : _paymentOnlineRepository = paymentOnlineRepository,
        _loginBloc = loginBloc,
        super(SubmitPaymentLinkInitial());

  PaymentLinkSuccessModel? paymentLinkSuccessModel;

  Future<void> submitPaymentLink(
      {String productCode = "", int listingId = 0, double price = 0.0}) async {
    debugPrint("------- submit payment link before loading------");
    emit(SubmitPaymentLinkLoading());
    debugPrint("------- submit payment link after loading------");
    final body = {
      "product_code": productCode,
      //productCode.trim(),
      "listing_id": listingId.toString(),
      //listingId.trim(),
      "price": price.toString()
    };
    debugPrint("------- submit payment link body : $body------");
    final result = await _paymentOnlineRepository.submitPaymentLink(
        _loginBloc.userInfo!.tokenModel.accessToken, body);
    debugPrint("------- submit payment link result : $result------");
    result.fold((failure) {
      debugPrint("------- submit payment link failure : $failure------");
      if (failure is InvalidAuthData) {
        final errors = SubmitPaymentLinkFormError(failure.errors);
        emit(errors);
      } else {
        final errors =
            SubmitPaymentLinkError(failure.message, failure.statusCode);
        emit(errors);
      }
    }, (success) {
      debugPrint("------- submit payment link success : $success------");
      paymentLinkSuccessModel = success;
      emit(SubmitPaymentLinkLoaded(success));
    });
  }
}
