part of 'contact_us_cubit.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object> get props => [];
}

class ContactUsInitial extends ContactUsState {
  const ContactUsInitial();
}

class ContactUsLoading extends ContactUsState {}

class ContactUsLoaded extends ContactUsState {
  final ContactUsModel contactUs;

  const ContactUsLoaded(this.contactUs);

  @override
  List<Object> get props => [contactUs];
}

class ContactUsError extends ContactUsState {
  final String message;
  final int statusCode;

  const ContactUsError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class ContactUsMessageLoading extends ContactUsState {}

class ContactUsMessageError extends ContactUsState {
  final String message;
  final int statusCode;

  const ContactUsMessageError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class ContactUsMessageFormValidate extends ContactUsState {
  final Errors errors;

  const ContactUsMessageFormValidate(this.errors);

  @override
  List<Object> get props => [errors];
}

class ContactUsMessageLoad extends ContactUsState {
  final String message;

  const ContactUsMessageLoad(this.message);

  @override
  List<Object> get props => [message];
}
