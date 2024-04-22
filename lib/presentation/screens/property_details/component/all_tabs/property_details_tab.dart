import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/custom_test_style.dart';

class PropertyDetailsTab extends StatelessWidget {
  const PropertyDetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final detail = state.singlePropertyModel.propertyItemModel;
          final additional = state.singlePropertyModel;

          return Column(
            children: [
              Html(
                data: detail!.description,
                style: {
                  'p': Style(
                    color: const Color(0xFF7E8BA0),
                    fontSize: FontSize(detailFontSize),
                    textAlign: TextAlign.start)
                },
              ),
              Utils.verticalSpace(20),
              if(additional.additionalInformations!.isNotEmpty)
              InfoSection(
                title: "Additional Details",
                listWidget: Wrap(
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      additional.additionalInformations!.length,
                      (index) => AdditionalInfo(
                        title1:
                            additional.additionalInformations![index].addKey,
                        value1: additional
                            .additionalInformations![index].addValue,
                      ),
                    ),
                  ],
                )
              ),
              if(additional.nearestLocations!.isNotEmpty)
              Utils.verticalSpace(20),
              if(additional.nearestLocations!.isNotEmpty)
              InfoSection(
                  title: "Nearest Location",
                  listWidget: Wrap(
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        additional.nearestLocations!.length,
                        (index) => AdditionalInfo(
                          title1: additional.nearestLocations![index].location!.location,
                          value1: '${additional.nearestLocations![index].distance}KM',
                        ),
                      ),
                    ],
                  )
                ),
              if(additional.aminities!.isNotEmpty)
              Utils.verticalSpace(20),
              if(additional.aminities!.isNotEmpty)
              InfoSection(
                  title: "Aminites",
                  listWidget: Wrap(
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        additional.aminities!.length,
                        (index) => Row(children: [
                          const Icon(Icons.done),
                          Utils.horizontalSpace(6),
                          CustomTextStyle(
                            text: additional.aminities![index].aminity!.aminity,
                            fontSize: detailFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ]),
                      ),
                    ],
                  )),
              Utils.verticalSpace(40),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.title,
    required this.listWidget,
  });

  final String title;
  final Widget listWidget;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: primaryColor,
      dashPattern: const [6, 6, 6],
      borderPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      radius: const Radius.circular(4),
      child: Container(
        decoration: BoxDecoration(
            color: scaffoldBackground, borderRadius: borderRadius),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextStyle(
              text: title,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            Utils.verticalSpace(12),
            listWidget,
          ],
        ),
      ),
    );
  }
}

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo(
      {Key? key,
      required this.title1,
      required this.value1,
      this.showBorder = true})
      : super(key: key);
  final String title1;
  final String value1;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextStyle(
              text: title1,
              fontSize: detailFontSize,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
            Utils.horizontalSpace(20),
            CustomTextStyle(
              text: value1,
              fontSize: detailFontSize,
              fontWeight: FontWeight.w400,
              color: grayColor,
            ),
          ],
        ),
        showBorder
            ? Container(
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                color: primaryColor.withOpacity(0.12),
              )
            : const SizedBox(),
      ],
    );
  }
}
