import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/utils.dart';
import '../../../data/model/agent/agent_details_model.dart';
import '../../../logic/cubit/agent/agent_state_model.dart';
import '../../utils/constraints.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import 'component/agent_information.dart';
import 'component/agent_property_list.dart';
import 'component/property_count.dart';

class AgentProfileScreen extends StatelessWidget {
  const AgentProfileScreen({Key? key, required this.userName})
      : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    final agentListCubit = context.read<AgentCubit>();
    agentListCubit.getAgentDetails(userName);
    //print('userName $userName');
    return Scaffold(
      // body: Center(child: Text("test")),
      body: BlocListener<AgentCubit, AgentStateModel>(
        listener: (context, state) {
          final agent = state.agentState;
          if (agent is AgentDetailsError) {
            if (agent.statusCode == 503) {
              Utils.errorSnackBar(context, 'Reloaded data after 500 ms');
              Future.delayed(const Duration(milliseconds: 500), () {
                agentListCubit.getAgentDetails(userName);
              });
            }
          }
        },
        child: BlocBuilder<AgentCubit, AgentStateModel>(
          builder: (context, state) {
            final agent = state.agentState;
            if (agent is AgentDetailsLoading) {
              return const LoadingWidget();
            } else if (agent is AgentDetailsError) {
              if (agent.statusCode == 503) {
                return LoadedAgentProfile(
                    agentDetails: agentListCubit.agentDetailsModel!);
              } else {
                return Center(
                  child: CustomTextStyle(
                    text: state.message,
                    color: redColor,
                  ),
                );
              }
            }
            // else if (state is AgentDetailsLoaded) {
            //   return LoadedAgentProfile(agentDetails: state.agentDetailsModel);
            // }
            return LoadedAgentProfile(
                agentDetails: agentListCubit.agentDetailsModel!);
          },
        ),
      ),
    );
  }
}

class LoadedAgentProfile extends StatelessWidget {
  const LoadedAgentProfile({Key? key, required this.agentDetails})
      : super(key: key);
  final AgentDetailsModel agentDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      children: [
        AgentInformation(agent: agentDetails.agent!),
        SizedBox(height: 40.h),
        PropertyCount(propertyCount: agentDetails),
        AgentPropertyList(
            properties: agentDetails.properties!.agentSingleProperty!),
        SizedBox(height: 40.h),
      ],
    );
  }
}
