import 'package:real_estate/data/model/online_payment/agrument_product_model.dart';
import 'package:real_estate/logic/cubit/maps/google_maps_cubit.dart';
import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../utils/utils.dart';
import '../../widget/create_update_button.dart';
import '../../widget/error_text.dart';
import 'component/additional_widget.dart';
import 'component/aminities_widget.dart';
import 'component/category_and_period.dart';
import 'component/location_widget.dart';
import 'component/nearest_widget.dart';
import 'component/plan_widget.dart';
import 'component/property_image_section.dart';

class AddNewPropertyScreen extends StatefulWidget {
  final String purpose;

  const AddNewPropertyScreen({Key? key, required this.purpose})
      : super(key: key);

  @override
  State<AddNewPropertyScreen> createState() => _AddNewPropertyScreenState();
}

class _AddNewPropertyScreenState extends State<AddNewPropertyScreen> {
  @override
  void initState() {
    final googleMapsCubit = context.read<GoogleMapsCubit>();
    googleMapsCubit.permissionGoogleMaps();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    bloc.add(PropertyPurposeEvent(purpose: widget.purpose));

    // final cubit = context.read<CreateInfoCubit>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(
        title: 'Add New Property',
        bgColor: whiteColor,
      ),
      body: BlocListener<PropertyCreateBloc, PropertyCreateModel>(
        listener: (context, state) {
          final stateStatus = state.state;
          if (stateStatus is PropertyCreateLoading) {
            Utils.loadingDialog(context);
          } else {
            Utils.closeDialog(context);
            if (stateStatus is PropertyCreateError) {
              Utils.errorSnackBar(context, stateStatus.errorMsg);
            } else if (stateStatus is PropertyCreateSuccess) {
              // Navigator.of(context).pop();
              Utils.showSnackBar(
                  context, stateStatus.dataSuccessCreateProperty.message);
              Navigator.pushNamed(context, RouteNames.subscriptionProductScreen,
                  arguments: ArgumentProductModel(
                      stateStatus.dataSuccessCreateProperty.id, "listing"));
            }
          }
        },
        child: Form(
          key: bloc.createForm,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            // physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            children: [
              defaultVerticalSpace,
              const CustomTextStyle(
                text: 'Property Information',
                color: primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: subtitleFontSize,
              ),
              defaultVerticalSpace,
              const PropertyTypeWidget(),
              if (widget.purpose == 'rent') ...[
                defaultVerticalSpace,
                const RentPeriodWidget(),
              ],
              defaultVerticalSpace,
              BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                // buildWhen: (previous, current) =>
                //     previous.title != current.title,
                builder: (context, state) {
                  final stateStatus = state.state;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        initialValue: state.title,
                        onChanged: (value) {
                          bloc.add(PropertyTitleEvent(title: value));
                        },
                        hintText: 'Title *',
                        labelText: 'Title *',
                        keyboardType: TextInputType.text,
                      ),
                      if (stateStatus is PropertyCreateInvalidError) ...[
                        if (stateStatus.errors.title.isNotEmpty)
                          ErrorText(text: stateStatus.errors.title.first)
                      ]
                    ],
                  );
                },
              ),
              // defaultVerticalSpace,
              // BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
              //   // buildWhen: (previous, current) => previous.slug != current.slug,
              //   builder: (context, state) {
              //     final stateStatus = state.state;
              //     return Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         CustomTextField(
              //           hintText: 'Slug *',
              //           labelText: 'Slug *',
              //           initialValue: state.slug,
              //           onChanged: (value) {
              //             final ss = value.replaceAll(' ', '-').toLowerCase().trim();
              //             bloc.add(PropertySlugEvent(slug: ss));
              //             //print('ss $ss');
              //           },
              //         ),
              //         if (stateStatus is PropertyCreateInvalidError) ...[
              //           if (stateStatus.errors.slug.isNotEmpty)
              //             ErrorText(text: stateStatus.errors.slug.first)
              //         ]
              //       ],
              //     );
              //   },
              // ),
              defaultVerticalSpace,
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      // buildWhen: (previous, current) =>
                      //     previous.price != current.price,
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Total Price *',
                              labelText: 'Total Price *',
                              initialValue: state.price.toString(),
                              onChanged: (value) =>
                                  bloc.add(PropertyPriceEvent(price: value)),
                              keyboardType: TextInputType.number,
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.price.isNotEmpty)
                                ErrorText(text: stateStatus.errors.price.first)
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                  Utils.horizontalSpace(7.w),
                  Expanded(
                    child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Total Area *',
                              labelText: 'Total Area *',
                              initialValue: state.totalArea,
                              onChanged: (value) => bloc.add(
                                  PropertyTotalAreaEvent(totalArea: value)),
                              keyboardType: TextInputType.number,
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.totalArea.isNotEmpty)
                                ErrorText(
                                    text: stateStatus.errors.totalArea.first)
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              defaultVerticalSpace,
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Total Unit *',
                              labelText: 'Total Unit *',
                              initialValue: state.totalUnit,
                              onChanged: (value) => bloc.add(
                                  PropertyTotalUnitEvent(totalUnit: value)),
                              keyboardType: TextInputType.number,
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.totalUnit.isNotEmpty)
                                ErrorText(
                                    text: stateStatus.errors.totalUnit.first)
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                  Utils.horizontalSpace(7.w),
                  Expanded(
                    child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Total Bedroom *',
                              labelText: 'Total Bedroom *',
                              initialValue: state.totalBedroom,
                              onChanged: (value) => bloc.add(
                                  PropertyTotalBedroomEvent(
                                      totalBedroom: value)),
                              keyboardType: TextInputType.number,
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.totalBedroom.isNotEmpty)
                                ErrorText(
                                    text: stateStatus.errors.totalBedroom.first)
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              defaultVerticalSpace,
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Total Garage *',
                              labelText: 'Total Garage *',
                              initialValue: state.totalGarage,
                              keyboardType: TextInputType.number,
                              onChanged: (value) => bloc.add(
                                  PropertyTotalGarageEvent(totalGarage: value)),
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.totalGarage.isNotEmpty)
                                ErrorText(
                                    text: stateStatus.errors.totalGarage.first)
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                  Utils.horizontalSpace(7.w),
                  Expanded(
                    child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Total Bathroom *',
                              labelText: 'Total Bathroom *',
                              initialValue: state.totalBathroom,
                              keyboardType: TextInputType.number,
                              onChanged: (value) => bloc.add(
                                  PropertyTotalBathroomEvent(
                                      totalBathroom: value)),
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.slug.isNotEmpty)
                                ErrorText(text: stateStatus.errors.slug.first)
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              defaultVerticalSpace,
              BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                builder: (context, state) {
                  final stateStatus = state.state;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'Total Kitchen *',
                        labelText: 'Total Kitchen *',
                        initialValue: state.totalKitchen,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => bloc.add(
                            PropertyTotalKitchenEvent(totalKitchen: value)),
                      ),
                      if (stateStatus is PropertyCreateInvalidError) ...[
                        if (stateStatus.errors.totalKitchen.isNotEmpty)
                          ErrorText(text: stateStatus.errors.totalKitchen.first)
                      ]
                    ],
                  );
                },
              ),
              defaultVerticalSpace,
              BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                builder: (context, state) {
                  final stateStatus = state.state;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'Description',
                        labelText: "Description",
                        initialValue: state.description,
                        keyboardType: TextInputType.text,
                        onChanged: (value) => bloc
                            .add(PropertyDescriptionEvent(description: value)),
                        maxLines: 5,
                      ),
                      if (stateStatus is PropertyCreateInvalidError) ...[
                        if (stateStatus.errors.description.isNotEmpty)
                          ErrorText(text: stateStatus.errors.description.first)
                      ]
                    ],
                  );
                },
              ),
              defaultVerticalSpace,
              const PropertyImageSection(),
              // defaultVerticalSpace,
              // const PropertyVideoWidget(),
              defaultVerticalSpace,
              const LocationWidget(),
              defaultVerticalSpace,
              const AminitiesWidget(),
              defaultVerticalSpace,
              const NearestWidget(),
              defaultVerticalSpace,
              const AdditionalWidget(),
              defaultVerticalSpace,
              const PlanWidget(),
              // defaultVerticalSpace,
              // const SeoWidget(),
              SizedBox(height: 1.sh * 0.05),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CreateUpdateSubmitButton(
        title: 'Submit Property',
        press: () {
          bloc.add(SubmitCreateProperty());
        },
      ),
    );
  }
}
