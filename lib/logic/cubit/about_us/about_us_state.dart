part of 'about_us_cubit.dart';

abstract class AboutUsState extends Equatable {
  const AboutUsState();

  @override
  List<Object> get props => [];
}

class AboutUsInitial extends AboutUsState {
  const AboutUsInitial();
}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUsModel aboutUs;

  const AboutUsLoaded(this.aboutUs);

  @override
  List<Object> get props => [aboutUs];
}

class AboutUsError extends AboutUsState {
  final String message;
  final int statusCode;

  const AboutUsError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
