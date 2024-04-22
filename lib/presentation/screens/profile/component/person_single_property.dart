import 'package:flutter/widgets.dart';
import 'package:real_estate/logic/cubit/maps/google_maps_cubit.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/online_payment/agrument_product_model.dart';
import '/presentation/utils/utils.dart';
import '../../../../data/model/product/property_item_model.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/favorite_button.dart';

class PersonSingleProperty extends StatelessWidget {
  const PersonSingleProperty({Key? key, required this.properties})
      : super(key: key);
  final List<PropertyItemModel> properties;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: properties.length,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final result = properties[index];
          return GestureDetector(
            onTap: () {
              if (result.status == 'enable') {
                Navigator.pushNamed(context, RouteNames.propertyDetailsScreen,
                    arguments: result.slug);
              } else {
                Utils.showSnackBar(context,
                    "This is not Approved property so you can't see details");
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: const EdgeInsets.all(propertyCardListPadding),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: propertyCardListPadding,
                              right: propertyCardListPadding),
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: Stack(
                              // fit: StackFit.expand,
                              children: [
                                CustomImage(
                                  // path: RemoteUrls.imageUrl(result.thumbnailImage),
                                  path: result.thumbnailImage,
                                  height: 140,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child:
                                      FavoriteButton(id: result.id.toString()),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomTextStyle(
                                    text: Utils.formatPrice(context,
                                        result.price.toStringAsFixed(2)),
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: titleFontSize,
                                  ),
                                  Expanded(
                                    child: CustomTextStyle(
                                      text: result.rentPeriod.isNotEmpty
                                          ? '/${result.rentPeriod}'
                                          : result.rentPeriod,
                                      color: grayColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: detailFontSize,
                                      maxLine: 1,
                                    ),
                                  ),
                                ],
                              ),
                              CustomTextStyle(
                                text: result.title,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.left,
                                fontSize: titleFontSize,
                                maxLine: 2,
                                overflow: TextOverflow.ellipsis,
                                height: 1.3,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomImage(
                                      path: KImages.locationIcon,
                                      height: propertyCardIconSize),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: CustomTextStyle(
                                      text: result.address,
                                      color: grayColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: detailFontSize,
                                      maxLine: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              //const SizedBox(height: 4.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // CustomTextStyle(text: 'Status'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            color: result.status == 'enable'
                                ? greenColor
                                : Colors.orange,
                            borderRadius: BorderRadius.circular(30.w),
                          ),
                          child: CustomTextStyle(
                            text: result.status == 'enable'
                                ? 'Active'
                                : 'Pending',
                            color: whiteColor,
                            fontSize: subtitleFontSize,
                          ),
                        ),
                        if (result.status != 'enable')
                          PayBtn(
                            id: result.id,
                          ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<GoogleMapsCubit>()
                                    .clearCurrentLatLng();
                                context.read<PropertyCreateBloc>().add(
                                      PropertyEditInfoEvent(
                                        propertyId: result.id.toString(),
                                      ),
                                    );
                                Navigator.pushNamed(
                                    context, RouteNames.updateScreen,
                                    arguments: result.id);
                              },
                              child: const EditBtn(),
                            ),
                            const SizedBox(width: 16.0),
                            DeleteBtn(
                                id: result.id.toString(),
                                status: result.status),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class PayBtn extends StatelessWidget {
  const PayBtn({
    super.key,
    this.id = 0,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        //width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: borderRadius,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.subscriptionProductScreen,
                arguments: ArgumentProductModel(id, "listing"));
          },
          child: const Text(
            "Pay",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}

class EditBtn extends StatelessWidget {
  const EditBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonIconSize,
      width: buttonIconSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: yellowColor,
        borderRadius: borderRadius,
      ),
      child: const CustomImage(
        path: KImages.editIcon,
        height: iconSize,
      ),
    );
  }
}

class DeleteBtn extends StatelessWidget {
  const DeleteBtn({super.key, required this.id, required this.status});

  final String id;
  final String status;

  @override
  Widget build(BuildContext context) {
    final updateCubit = context.read<UpdateCubit>();
    if (status == 'enable') {}
    return BlocListener<UpdateCubit, UpdateState>(
      listenWhen: (context, state) => status == 'enable',
      listener: (context, state) {
        if (state is DeletePropertyLoading) {
          Utils.loadingDialog(context);
        } else {
          Utils.closeDialog(context);
          if (state is PropertyDeleteSuccess) {
            Navigator.of(context).pop();
            Utils.showSnackBar(context, state.message);
          } else if (state is UpdateStateError) {
            Utils.errorSnackBar(context, state.errorMessage);
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          if (status == 'enable') {
            showDialog<void>(
              context: context,
              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const CustomTextStyle(
                    text: 'Confirmation',
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                  ),
                  content: const CustomTextStyle(
                    text: 'Do you want to delete this property?',
                    fontSize: subtitleFontSize,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const CustomTextStyle(
                        text: 'Cancel',
                        color: blackColor,
                      ),
                      onPressed: () {
                        Navigator.of(dialogContext)
                            .pop(); // Dismiss alert dialog
                      },
                    ),
                    TextButton(
                      child: const CustomTextStyle(
                        text: 'Delete',
                        color: redColor,
                      ),
                      onPressed: () {
                        updateCubit.deleteProperty(id);
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            Utils.showSnackBar(
                context, "This is not Approved property so you can't Delete");
          }
        },
        child: Container(
          height: buttonIconSize,
          width: buttonIconSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: borderRadius,
          ),
          child: const Icon(
            Icons.delete_outline_outlined,
            color: whiteColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
