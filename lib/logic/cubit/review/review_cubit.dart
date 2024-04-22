import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/review/review_model.dart';
import '../../bloc/login/login_bloc.dart';
import '../../repository/review_repository.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final LoginBloc _loginBloc;
  final ReviewRepository _reviewRepository;

  ReviewCubit({
    required LoginBloc loginBloc,
    required ReviewRepository reviewRepository,
  })  : _loginBloc = loginBloc,
        _reviewRepository = reviewRepository,
        super(ReviewInitial());

  List<ReviewModel> reviews = [];

  Future<void> getReviewList() async {
    emit(ReviewLoading());
    final result = await _reviewRepository
        .getReviewList(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((failure) {
      emit(ReviewError(failure.message, failure.statusCode));
    }, (success) {
      reviews = success;
      emit(ReviewLoaded(success));
    });
  }
}
