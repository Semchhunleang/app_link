import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/presentation/error/failure.dart';

import '../../../data/model/auth/auth_error_model.dart';
import '../../../data/model/contact_us/contact_us_model.dart';
import '../../repository/contact_us_repository.dart';
import 'contact_us_state_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsStateModel> {
  final ContactUsRepository _contactUsRepository;

  ContactUsCubit({
    required ContactUsRepository contactUsRepository,
  })  : _contactUsRepository = contactUsRepository,
        super(ContactUsStateModel.init());

  ContactUsModel? contactUs;

  void nameChange(String text) {
    emit(state.copyWith(name: text, contactUsState: const ContactUsInitial()));
  }

  void emailChange(String text) {
    emit(state.copyWith(email: text, contactUsState: const ContactUsInitial()));
  }

  void phoneChange(String text) {
    emit(state.copyWith(phone: text, contactUsState: const ContactUsInitial()));
  }

  void subjectChange(String text) {
    emit(state.copyWith(
        subject: text, contactUsState: const ContactUsInitial()));
  }

  void messageChange(String text) {
    emit(state.copyWith(
        message: text, contactUsState: const ContactUsInitial()));
  }

  Future<void> getContactUs() async {
    emit(state.copyWith(contactUsState: ContactUsLoading()));
    final result = await _contactUsRepository.getContactUs();
    result.fold((failure) {
      final error = ContactUsError(failure.message, failure.statusCode);
      emit(state.copyWith(contactUsState: error));
    }, (success) {
      contactUs = success;
      emit(state.copyWith(contactUsState: ContactUsLoaded(success)));
    });
  }

  Future<void> sendContactUsMessage() async {
    emit(state.copyWith(contactUsState: ContactUsMessageLoading()));
    print('messageBody: $state');
    final result = await _contactUsRepository.sendContactUsMessage(state);
    result.fold((failure) {
      if (failure is InvalidAuthData) {
        final error = ContactUsMessageFormValidate(failure.errors);
        emit(state.copyWith(contactUsState: error));
      } else {
        final error =
            ContactUsMessageError(failure.message, failure.statusCode);
        emit(state.copyWith(contactUsState: error));
      }
    }, (message) {
      emit(state.copyWith(contactUsState: ContactUsMessageLoad(message)));
      //emit(state.clear());
    });
  }

  Future<void> clear() async {
    emit(state.clear());
  }
}
