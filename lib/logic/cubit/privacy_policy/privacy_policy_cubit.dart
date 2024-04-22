import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/model/privacy/faq_model/faq_model.dart';
import '../../repository/privacy_policy_repository.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  final PrivacyPolicyRepository _repository;

  PrivacyPolicyCubit({required PrivacyPolicyRepository repository})
      : _repository = repository,
        super(PrivacyPolicyInitial());

  FaqModel? faqContent;
  String? privacyText;
  String? termsConditionText;

  Future<void> getFaqContent() async {
    emit(PrivacyPolicyLoading());
    final result = await _repository.getFaqContent();
    result.fold((failure) {
      emit(PrivacyPolicyError(failure.message, failure.statusCode));
    }, (success) {
      faqContent = success;
      emit(FaqContentLoaded(success));
    });
  }

  Future<void> getPrivacyPolicy() async {
    emit(PrivacyPolicyLoading());
    final result = await _repository.getPrivacyPolicy();
    result.fold((failure) {
      emit(PrivacyPolicyError(failure.message, failure.statusCode));
    }, (success) {
      privacyText = success;
      emit(PrivacyPolicyLoaded(success));
    });
  }

  Future<void> getTermsAndCondition() async {
    emit(PrivacyPolicyLoading());
    final result = await _repository.getTermsAndCondition();
    result.fold((failure) {
      emit(PrivacyPolicyError(failure.message, failure.statusCode));
    }, (success) {
      termsConditionText = success;
      emit(TermsAndConditionLoaded(success));
    });
  }
}
