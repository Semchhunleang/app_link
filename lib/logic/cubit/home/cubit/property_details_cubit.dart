import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/product/single_property_model.dart';
import '../../../repository/home_repository.dart';

part 'property_details_state.dart';

class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
  final HomeRepository _homeRepository;
  PropertyDetailsCubit(HomeRepository homeRepository)
      : _homeRepository = homeRepository,
        super(PropertyDetailsInitial());

  SinglePropertyModel? singleProperty;

  Future<void> fetchPropertyDetails(String slug) async {
    emit(PropertyDetailsLoading());
    final result = await _homeRepository.getSingleProperty(slug);
    result.fold(
      (failuer) {
        emit(PropertyDetailsError(failuer.message, failuer.statusCode));
      },
      (data) {
        singleProperty = data;
        emit(PropertyDetailsLoaded(data));
      },
    );
  }
}
