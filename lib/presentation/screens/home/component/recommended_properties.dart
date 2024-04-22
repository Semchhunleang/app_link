import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/home/cubit/home_cubit.dart';
import '../../../router/route_names.dart';
import 'headline_text.dart';
import 'single_property_card_view.dart';

class RecommendedProperties extends StatelessWidget {
  const RecommendedProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>().homeModel.sliderProperty;
    return Column(
      children: [
        HeadlineText(
            text: 'Recommended for You',
            onTap: () => Navigator.pushNamed(
                context, RouteNames.allRecommendedPropertyScreen)),
        ListView.builder(
          itemCount: homeCubit!.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0)
              .copyWith(bottom: 40.0),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = homeCubit[index];
            return GestureDetector(
                onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.propertyDetailsScreen,
                      arguments: item.slug,
                    ),
                child: SinglePropertyCardView(property: item));
          },
        ),
      ],
    );
  }
}
