import 'package:flutter/material.dart';
import '/presentation/widget/custom_test_style.dart';
import '../../../../data/model/agent/agent_single_property_model.dart';
import '../../../router/route_names.dart';
import 'agent_single_property.dart';

class AgentPropertyList extends StatelessWidget {
  const AgentPropertyList({Key? key, required this.properties})
      : super(key: key);
  final List<AgentSingleProperty> properties;

  @override
  Widget build(BuildContext context) {
    if (properties.isNotEmpty) {
      return ListView.builder(
        itemCount: properties.length,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(
              context, RouteNames.propertyDetailsScreen,
              arguments: properties[index].slug),
          child: AgentProperty(property: properties[index]),
        ),
      );
    } else {
      return const Center(
        child: CustomTextStyle(text: 'No Items Found', fontSize: 20.0),
      );
    }
  }
}
