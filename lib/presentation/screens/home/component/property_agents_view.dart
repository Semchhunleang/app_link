import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '/data/model/home/agents_model.dart';
import '../../../core/dummy_text.dart';
import '../../../router/route_names.dart';
import 'headline_text.dart';
import 'single_broker_agent_card_view.dart';

class PropertyAgentView extends StatelessWidget {
  const PropertyAgentView({Key? key, required this.agentsModel})
      : super(key: key);
  final AgentsModel agentsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineText(
            text: 'Property Agents',
            onTap: () => Navigator.pushNamed(
                context, RouteNames.allBrokerAgentListScreen)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Row(
            children: List.generate(agentsModel.agents.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 0.0 : spaceBetweenCardAndCard,
                    right: index == brokerList.length - 1 ? 0 : 0.0),
                child: SingleBrokerAgentCartView(
                  agent: agentsModel.agents[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
