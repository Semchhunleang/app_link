import 'package:equatable/equatable.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '/data/model/agent/agent_details_model.dart';
import '/data/model/agent/agent_list_model.dart';
import '/data/model/auth/auth_error_model.dart';
import '../../../presentation/error/failure.dart';
import 'agent_state_model.dart';
import 'dart:async';

part 'agent_state.dart';

class AgentCubit extends Cubit<AgentStateModel> {
  final AgentRepository _agentRepository;

  AgentCubit({
    required AgentRepository agentRepository,
  })  : _agentRepository = agentRepository,
    super(const AgentStateModel()){
      scrollController.addListener((){
      
          final maxScroll = scrollController.position.maxScrollExtent;
          final currentScroll = scrollController.position.pixels;
          if(numPage == 2){
            // print("=========== 30");
            thirtyPercent = maxScroll * 0.3;
          }
          if (currentScroll >= (maxScroll-thirtyPercent)) {
            getAllAgentByPage();
          }
      });
    }



  void nameChange(String text) {
    emit(state.copyWith(name: text, agentState: const AgentInitial()));
  }

  void emailChange(String text) {
    emit(state.copyWith(email: text, agentState: const AgentInitial()));
  }

  void agentEmailChange(String text) {
    emit(state.copyWith(agentEmail: text, agentState: const AgentInitial()));
  }

  void subjectChange(String text) {
    emit(state.copyWith(subject: text, agentState: const AgentInitial()));
  }

  void messageChange(String text) {
    emit(state.copyWith(message: text, agentState: const AgentInitial()));
  }

  // final agents = <AgentListModel>[];

  AgentListModel? agents;
  AgentDetailsModel? agentDetailsModel;

  Future<void> getAllAgent() async {
    emit(state.copyWith(agentState: AgentLoading()));
    final result = await _agentRepository.getAllAgent();
    result.fold((failure) {
      emit(state.copyWith(
          agentState: AgentError(failure.message, failure.statusCode)));
    }, (success) {
      agents = success;
      emit(state.copyWith(agentState: AgentLoaded(success)));
    });
  }

  double thirtyPercent = 0;
  final scrollController = ScrollController();
  int numPage = 2;
  // bool isTakingMoreData = false;
  // bool isFetchingData = false;
  bool isFetchingData = false;
  bool isLoading = false;
  Timer? _debounce;

  Future<void> getAllAgentByPage() async {
    if (isFetchingData) return;
    isFetchingData = true;   
    emit(state.copyWith(agentState: AgentLoadMore()));
    isLoading = true;
    
    final result = await _agentRepository.getAllAgentByPage("$numPage");
      // if(scrollController.position.maxScrollExtent == scrollController.offset){
   
      //   print("get data page ==================");
      // }
    result.fold((failure) {
      emit(state.copyWith(
          agentState: AgentError(failure.message, failure.statusCode)));
          
          print("------------Error occurred: ${failure.statusCode}---------");
          isLoading = false;
    }, (success) {
      // agents!.agents.addAll(success.agents);
      // print("Agent =======");
      // print(success.agents);
      // isTakingMoreData = false;

      // numPage = numPage +1;
      // agents!.agents!.addAll(success.agents!);
      // emit(state.copyWith(agentState: AgentLoaded(agents!)));

      numPage++;
      print("page ==========");
      print(numPage);
      agents!.agents!.addAll(success.agents!);
      emit(state.copyWith(agentState: AgentLoaded(agents!)));
      isLoading = false;
    });

    _debounce?.cancel(); // Cancel any existing timer
    _debounce = Timer(Duration(seconds: 1), () {
      isFetchingData = false;
    });
  }

  

  Future<void> getAgentDetails(String userName) async {
    emit(state.copyWith(agentState: AgentDetailsLoading()));
    // final Map<String, String> param = {
    //   'agent_type': 'agent',
    //   'user_name': userName
    // };
    final result = await _agentRepository.getAgentDetails(userName);
    result.fold((failure) {
      emit(state.copyWith(
          agentState: AgentDetailsError(failure.message, failure.statusCode)));
    }, (success) {
      agentDetailsModel = success;
      emit(state.copyWith(agentState: AgentDetailsLoaded(success)));
    });
  }

  Future<void> sendMessageToAgent() async {
    emit(state.copyWith(agentState: AgentSendMessageLoading()));
    print('messages: $state');
    final result = await _agentRepository.sendMessageToAgent(state);
    result.fold((failure) {
      if (failure is InvalidAuthData) {
        final errors = AgentSendMessageFormValidate(failure.errors);
        emit(state.copyWith(agentState: errors));
      } else {
        emit(state.copyWith(
            agentState:
                AgentSendMessageError(failure.message, failure.statusCode)));
      }
    }, (message) {
      emit(state.copyWith(agentState: AgentSendMessageLoad(message)));
      emit(state.clear());
    });
  }
}
