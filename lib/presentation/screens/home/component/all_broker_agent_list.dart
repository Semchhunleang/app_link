import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/widget/custom_test_style.dart';
import '/presentation/widget/loading_widget.dart';
import '../../../../data/model/auth/user_profile_model.dart';
import '../../../../logic/cubit/agent/agent_state_model.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import 'single_broker_agent_card_view.dart';

class AllBrokerAgentListScreen extends StatelessWidget {
  const AllBrokerAgentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final agentListCubit = context.read<AgentCubit>();
    agentListCubit.numPage = 2;
    agentListCubit.getAllAgent();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: CustomAppBar(
        title:
            agentListCubit.agents!.seoSetting!.pageName ?? 'All Broker Agent',
      ),
      body: BlocBuilder<AgentCubit, AgentStateModel>(
        builder: (context, state) {
          final agent = state.agentState;
          if (agent is AgentLoading) {
            return const LoadingWidget();
          } else if (agent is AgentError) {
            if (agent.statusCode == 503) {
              return LoadedAgentList(agents: agentListCubit.agents!.agents!, isLoading: false,);
            } else {
              return Center(
                child: CustomTextStyle(
                  text: agent.message,
                  color: redColor,
                ),
              );
            }
          }
          // else if (state is AgentListLoaded) {
          //   return LoadedAgentList(agents: state.agents.agents!);
          // }
          // agent is AgentLoadMore ? true:false,
          return LoadedAgentList(agents: agentListCubit.agents!.agents!, isLoading: agentListCubit.isLoading);
        },
      ),
    );
  }
}

class LoadedAgentList extends StatelessWidget {
  const LoadedAgentList({Key? key, required this.agents, required this.isLoading}) : super(key: key);
  final List<UserProfileModel> agents;
  final bool isLoading;
  
  @override
  Widget build(BuildContext context) {
    final agentListCubit = context.read<AgentCubit>();
    return Stack(
      children: [
        GridView.builder(
          controller: agentListCubit.scrollController,
          itemCount: agents.length, //isLoading && agents.length >= 8 ? (agents.length+1):agents.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal:paddingHorizontal, vertical: paddingHorizontal).copyWith(bottom: 50),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: spaceBetweenCardAndCard,
              crossAxisSpacing: spaceBetweenCardAndCard,
              crossAxisCount:  isIpad ? 3:2,
              mainAxisExtent: 240
              ),
          itemBuilder: (context, index) {
            if(index < agents.length){
              return SingleBrokerAgentCartView(agent: agents[index]);
            }else{
              return SizedBox(
                width: 40,
                height: 40,
                child: const CircularProgressIndicator(color: primaryColor,)
              );
            }
          }
        ),
        if(isLoading)
        Positioned(
          width: 1.sw,
          bottom: 5,
          child: Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: const CircularProgressIndicator(color: primaryColor,)
            ),
          )
        )
      ],
    );
  }
}
