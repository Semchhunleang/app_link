import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/data_provider/remote_url.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../repository/payment_repository.dart';

part 'flutter_wave_payment_state.dart';

class FlutterWavePaymentCubit extends Cubit<FlutterWavePaymentState> {
  final LoginBloc _loginBloc;
  final PaymentRepository _paymentRepository;

  FlutterWavePaymentCubit(
      {required LoginBloc loginBloc,
      required PaymentRepository paymentRepository})
      : _paymentRepository = paymentRepository,
        _loginBloc = loginBloc,
        super(FlutterWavePaymentInitial());

  Future<void> flutterWavePayment(String planSlug) async {
    emit(FlutterWavePaymentLoading());
    final uri = Uri.parse(RemoteUrls.payWithFlutterWave(
        _loginBloc.userInfo!.tokenModel.accessToken, planSlug));
    print('uriiiii: $uri');
    final result = await _paymentRepository.flutterWavePayment(uri);
    result.fold(
        (failure) =>
            FlutterWavePaymentError(failure.message, failure.statusCode),
        (success) => FlutterWavePaymentLoaded(success));
  }
}
