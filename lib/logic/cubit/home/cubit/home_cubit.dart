import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/home/home_data_model.dart';
import '../../../repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  late HomeDataModel homeModel;
  HomeCubit(HomeRepository homeRepository)
      : _homeRepository = homeRepository,
        super(HomeLoadingState()) {
    getHomeData();
  }

  Future<void> getHomeData() async {
    emit(HomeLoadingState());

    final result = await _homeRepository.getHomeData();
    result.fold(
      (failuer) {
        emit(HomeErrorState(error: failuer.message));
      },
      (data) {
        homeModel = data;
        emit(HomeDataLoaded(homeDataLoaded: data));
      },
    );
  }
}
