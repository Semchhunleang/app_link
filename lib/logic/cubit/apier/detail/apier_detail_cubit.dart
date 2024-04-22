import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/apier/detail_apier_byfilter_model.dart';
import 'package:real_estate/logic/repository/apier_repository.dart';
import 'package:real_estate/state_inject_package_names.dart';
part 'apier_detail_state.dart';

class ApierDetailCubit extends Cubit<ApierDetailState> {
  final ApierRepository _repository;
  final LoginBloc _loginBloc;
  ApierDetailCubit({required ApierRepository repository, required LoginBloc loginBloc}) : _repository = repository, _loginBloc = loginBloc, super(ApierDetailInitial()){
    scrollController.addListener((){
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      if(numPage == 2){
        // print("=========== 30");
        thirtyPercent = maxScroll * 0.4;
      }
      if (currentScroll >= (maxScroll-thirtyPercent)) {
        // getByPage();
      }
    });
  }

  double thirtyPercent = 0;
  int numPage = 2;
  final scrollController = ScrollController();
  bool hasMore = true;
  Future <void> clearVariables ()async {
    hasMore = true;
    numPage = 2;
  }

  DetailApierByFilterModel? detailApier;

  Future<void> getApierDetailByFilter(String startDate, String endDate, String depth) async {
    emit(ApierDetailLoading());
    final result = await _repository.getApierDetailByFilter(_loginBloc.userInfo!.tokenModel.accessToken, startDate, endDate, depth);
    result.fold((failure) {
      emit(ApierDetailError(error: failure.message, statusCode: failure.statusCode));
    }, (data) {
      detailApier = data;
      emit(ApierDetailLoaded());
    });
  }
}
