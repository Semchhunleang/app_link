import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/model/about_us/about_us_model.dart';
import '../../repository/contact_us_repository.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final ContactUsRepository _contactUsRepository;

  AboutUsCubit({
    required ContactUsRepository contactUsRepository,
  })  : _contactUsRepository = contactUsRepository,
        super(const AboutUsInitial()) {
    getAboutUs();
  }

  AboutUsModel? aboutUs;

  Future<void> getAboutUs() async {
    emit(AboutUsLoading());
    final result = await _contactUsRepository.getAboutUs();
    result.fold((failure) {
      print("========1");
      print(failure.message);
      emit(AboutUsError(failure.message, failure.statusCode));
    }, (success) {
    
      aboutUs = success;
      emit(AboutUsLoaded(success));
    });
  }
}
