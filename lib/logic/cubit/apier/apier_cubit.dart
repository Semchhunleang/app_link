import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/apier/filter_options_model.dart';
import 'package:real_estate/data/model/apier/summary_model.dart';
import 'package:real_estate/logic/cubit/apier/apier_state_model.dart';
import 'package:real_estate/logic/repository/apier_repository.dart';
import 'package:real_estate/state_inject_package_names.dart';
part 'apier_state.dart';

class ApierCubit extends Cubit<ApierStateModel> {
  final ApierRepository _repository;
  final LoginBloc _loginBloc;
  ApierCubit({
    required ApierRepository repository, 
    required LoginBloc loginBloc}) 
    :_repository = repository, 
    _loginBloc = loginBloc, 
    super(ApierStateModel());


  SummaryApierModel? summaryData;
  FilterOptionsModel? dateFilter;

  Future<void> getFilterOption() async {
    emit(state.copyWith(apierState: ApierLoading()));
    final result = await _repository.getFilterOption(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((failure) {
      emit(state.copyWith(apierState: ApierError(message: failure.message, statusCode: failure.statusCode)));
    }, (data) {
      dateFilter = data;
      emit(state.copyWith(apierState: ApierLoaded(filterData: data)));
    });
  }

  bool showOptions = false;
  String selectedOption = 'Today';
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();
  String startDate = DateTime.now().toString();
  String endDate = DateTime.now().toString();

  Future<void> getApierFilterData(String startDate, String endDate) async {
      emit(state.copyWith(apierState: ApierLoading()));
    final result = await _repository.getSummaryData(_loginBloc.userInfo!.tokenModel.accessToken, startDate, endDate);
    result.fold((failure) {
      emit(state.copyWith(apierState: ApierError(message: failure.message, statusCode: failure.statusCode)));
    }, (data) {
      summaryData = data;
      emit(state.copyWith(apierState: ApierLoaded(summaryData: data)));
    });
  }

  void onSelectDateChange(String selectedOption_, String startDate_, String endDate_) {
    selectedOption = selectedOption_;
    startDate = startDate_;
    endDate = endDate_;
    showOptions = false;
    emit(state.copyWith(selectedOption: selectedOption_, startDate: startDate_, endDate: endDate_, apierState: const ApierInitial()));
      // emit(state.copyWith(email: text, contactUsState: const ContactUsInitial()));
  }

  void onSelectShow() {
    showOptions =!showOptions;
    emit(state.copyWith(showOptions: !showOptions, apierState: const ApierInitial()));
  }

  void clearOptions() {
    showOptions = false;
    selectedOption = 'Today';
    startDate = DateTime.now().toString();
    endDate = DateTime.now().toString();
  }

  // Future<void> getApierFilterData(String startDate, String endDate) async {
  //   emit(ApierLoading());
  //   final result = await _repository.getSummaryData(_loginBloc.userInfo!.tokenModel.accessToken,"2024-04-01", "2024-04-30");
  //   result.fold((failure) {
  //     emit(ApierError(error: failure.message, statusCode: failure.statusCode));
  //   }, (data) {
  //     summaryData = data;
  //     emit(ApierLoaded(summaryData: data));
  //   });
  //   // emit(ApierLoading());
  // }

}
