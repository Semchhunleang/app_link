import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/home/cubit/home_cubit.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../router/route_names.dart';
import 'single_property_card_view.dart';

class AllRecommendedProperties extends StatelessWidget {
  const AllRecommendedProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>().homeModel.sliderProperty;
    // print(homeCubit.properties.length);
    // print(homeCubit.description);
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: const CustomAppBar(
        title: 'Recommended Property',
      ),
      body: ListView.builder(
        itemCount: homeCubit!.length,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)
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
    );
  }
}
