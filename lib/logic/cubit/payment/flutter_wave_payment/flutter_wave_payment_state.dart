part of 'flutter_wave_payment_cubit.dart';

abstract class FlutterWavePaymentState extends Equatable {
  const FlutterWavePaymentState();

  @override
  List<Object> get props => [];
}

class FlutterWavePaymentInitial extends FlutterWavePaymentState {}

class FlutterWavePaymentLoading extends FlutterWavePaymentState {}

class FlutterWavePaymentLoaded extends FlutterWavePaymentState {
  final Map<String, dynamic> success;

  const FlutterWavePaymentLoaded(this.success);

  @override
  List<Object> get props => [success];
}

class FlutterWavePaymentError extends FlutterWavePaymentState {
  final String message;
  final int statusCode;

  const FlutterWavePaymentError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
