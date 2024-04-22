import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/data_provider/remote_url.dart';
import '/data/model/search_response_model/search_property_model.dart';
import '../../../data/model/search_response_model/search_response_model.dart';
import '../../repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;

  SearchResponseModel? _searchResponseModel;
  List<SearchProperty> property = [];

  SearchBloc({required SearchRepository searchRepository})
      : _searchRepository = searchRepository,
        super(SearchInitial()) {
    on<SearchEventProperty>(_searchProperty);
    on<SearchEventLoadMoreProperty>(_searchMoreProperty);
  }

  Future<void> _searchProperty(
      SearchEventProperty event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final uri = Uri.parse(RemoteUrls.getSearchProperty)
        .replace(queryParameters: {'search': event.name});
    final result = await _searchRepository.getSearchProperty(uri);
    result.fold((failure) {
      emit(SearchError(failure.message, failure.statusCode));
    }, (success) {
      property = success.data!;
      emit(SearchLoaded(success.data!));
    });
  }

  Future<void> _searchMoreProperty(
      SearchEventLoadMoreProperty event, Emitter<SearchState> emit) async {
    if (state is SearchMorePropertyLoading) return;
    if (_searchResponseModel == null) {
      return;
    }
    emit(SearchMorePropertyLoading());
    final uri = Uri.parse(_searchResponseModel!.nextPageUrl);
    final result = await _searchRepository.getSearchProperty(uri);

    result.fold((failure) {
      emit(SearchMorePropertyError(failure.message, failure.statusCode));
    }, (success) {
      _searchResponseModel = success;
      property.addAll(success.data!);
      emit(SearchMorePropertyLoaded(property.toSet().toList()));
    });
  }
}
