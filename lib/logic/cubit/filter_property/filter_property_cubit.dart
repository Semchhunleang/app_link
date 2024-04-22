import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../../data/model/filter/filter_property_list_model.dart';
import 'filter_property_state_model.dart';

part 'filter_property_state.dart';

class FilterPropertyCubit extends Cubit<FilterPropertyStateModel> {
  final FilterPropertyRepository _repository;

  FilterPropertyCubit(
      {required FilterPropertyRepository filterPropertyRepository})
      : _repository = filterPropertyRepository,
        super(FilterPropertyStateModel.init()){

            scrollController.addListener((){
              final maxScroll = scrollController.position.maxScrollExtent;
              final currentScroll = scrollController.position.pixels;
              if(numPage == 2){
                // print("=========== 30");
                thirtyPercent = maxScroll * 0.4;
              }
              if (currentScroll >= (maxScroll-thirtyPercent)) {
                getPropertyByPage();
              }
            });
        }

  FilterPropertyListModel? property;
  FilterPropertyListModel? filterProperty;

  double thirtyPercent = 0;
  int numPage = 2;
  final scrollController = ScrollController();

  void searchChange(String text) {
    emit(state.copyWith(
        search: text, filterState: const FilterPropertyInitial()));
  }

  void featurePropertyChange(String text) {
    emit(state.copyWith(
        featureProperty: text, filterState: const FilterPropertyInitial()));
  }

  void purposeChange(String text) {
    emit(state.copyWith(
        purpose: text, filterState: const FilterPropertyInitial()));
  }

  void locationChange(String text) {
    emit(state.copyWith(
        location: text, filterState: const FilterPropertyInitial()));
  }

  void typeChange(String text) {
    emit(state.copyWith(type: text, filterState: const FilterPropertyInitial()));
  }

  void roomChange(List<int> rooms) {
    emit(state.copyWith(
        rooms: rooms, filterState: const FilterPropertyInitial()));
  }

  void bathRoomChange(List<int> rooms) {
    emit(state.copyWith(
        bathRooms: rooms, filterState: const FilterPropertyInitial()));
  }

  void minAreaChange(int value) {
    emit(state.copyWith(
        minArea: value, filterState: const FilterPropertyInitial()));
  }

  void maxAreaChange(int value) {
    emit(state.copyWith(
        maxArea: value, filterState: const FilterPropertyInitial()));
  }

  void minPriceChange(int value) {
    emit(state.copyWith(
        minPrice: value, filterState: const FilterPropertyInitial()));
  }

  void maxPriceChange(int value) {
    emit(state.copyWith(
        maxPrice: value, filterState: const FilterPropertyInitial()));
  }


  Future<void> getAllProperty() async {
    
    emit(state.copyWith(filterState: FilterPropertyLoading()));
    
    final result = await _repository.getAllProperty();
    result.fold((failure) {
      emit(state.copyWith(filterState:FilterPropertyError(failure.message, failure.statusCode)));
    }, (success) {
        property = success;
        emit(state.copyWith(filterState: FilterPropertyLoaded(success)));
    });
  }

  bool isFetchingData = false;
  Timer? _debounce;
  // bool isLoading = false;
  bool hasMore = true;
  Future <void> clearVariables ()async {
    hasMore = true;
    numPage = 2;
  }

  Future<void> getPropertyByPage() async {
    if (isFetchingData) return;
    isFetchingData = true;
    // isLoading = true;
    emit(state.copyWith(filterState: FilterPropertyLoadMorePage()));
    final result = await _repository.getPropertyByPage("$numPage");
    result.fold((failure) {
      emit(state.copyWith(filterState:FilterPropertyError(failure.message, failure.statusCode)));
      //  isLoading = false;
    }, (success) {
      if(success.properties!.data!.length < 6){
        hasMore = false;
      }
      property!.properties!.data!.addAll(success.properties!.data!);
      emit(state.copyWith(filterState: FilterPropertyLoaded(property!)));
      // isLoading = false;
      numPage ++;
    });

      _debounce?.cancel(); // Cancel any existing timer
    _debounce = Timer(const Duration(seconds: 1), () {
      isFetchingData = false;
    });
  }



  Future<void> getFilterProperty() async {
    emit(state.copyWith(filterState: FilterPropertyLoading()));
    Uri uri = Uri.parse(RemoteUrls.getFilterProperty)
        .replace(queryParameters: state.toMap());
    print('stateParams: ${state.toMap()}');
    print('uri: $uri');
    final result = await _repository.getFilterProperty(uri);
    result.fold((failure) {
      emit(state.copyWith(
          filterState:
              FilterPropertyError(failure.message, failure.statusCode)));
    }, (success) {
      filterProperty = success;
      emit(state.copyWith(filterState: FilterPropertyLoaded(success)));
      //emit(state.copyWith(filterState: const FilterStateClear('state clear')));
      print('clear all filter data');
    });
  }

  Future<void> getFilterPropertyByType(String type) async {
    emit(state.copyWith(filterState: FilterPropertyLoading()));
    Uri uri = Uri.parse(RemoteUrls.getFilterProperty)
        .replace(queryParameters: {'type': type});
    print('typeProperty: $uri');
    final result = await _repository.getFilterProperty(uri);
    result.fold((failure) {
      emit(state.copyWith(
          filterState:
              FilterPropertyError(failure.message, failure.statusCode)));
    }, (success) {
      filterProperty = success;
      emit(state.copyWith(filterState: FilterPropertyLoaded(success)));
      //emit(state.copyWith(filterState: const FilterStateClear('state clear')));
      //print('clear all filter data');
    });
  }

  Future<void> clear() async {
    emit(state.clear());
  }
}
