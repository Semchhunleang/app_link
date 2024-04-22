part of 'privacy_policy_cubit.dart';

abstract class PrivacyPolicyState extends Equatable {
  const PrivacyPolicyState();

  @override
  List<Object> get props => [];
}

class PrivacyPolicyInitial extends PrivacyPolicyState {}

class PrivacyPolicyLoading extends PrivacyPolicyState {}

class PrivacyPolicyLoaded extends PrivacyPolicyState {
  final String privacyPolicy;

  const PrivacyPolicyLoaded(this.privacyPolicy);

  @override
  List<Object> get props => [privacyPolicy];
}

class FaqContentLoaded extends PrivacyPolicyState {
  final FaqModel faqContent;

  const FaqContentLoaded(this.faqContent);

  @override
  List<Object> get props => [faqContent];
}

class TermsAndConditionLoaded extends PrivacyPolicyState {
  final String termsConditions;

  const TermsAndConditionLoaded(this.termsConditions);

  @override
  List<Object> get props => [termsConditions];
}

class PrivacyPolicyError extends PrivacyPolicyState {
  final String message;
  final int statusCode;

  const PrivacyPolicyError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
