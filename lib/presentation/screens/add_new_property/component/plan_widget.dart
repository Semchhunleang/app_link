import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/create_property/property_plan_dto.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/form_header_title.dart';
import '../../../widget/item_add_delete_btn.dart';
import '../../profile/component/person_single_property.dart';

class PlanWidget extends StatefulWidget {
  const PlanWidget({super.key});

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  int planItem = 1;
  final titleTextField = <TextEditingController>[TextEditingController()];
  final desTextField = <TextEditingController>[TextEditingController()];
  final planImages = <String>[];
  List<PropertyPlanDto> planList = <PropertyPlanDto>[];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();

    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        final updateCubit = context.read<UpdateCubit>();
        if (state.propertyPlanDto.isNotEmpty) {
          planList = state.propertyPlanDto;
          planItem = state.propertyPlanDto.length;

          for (var i = 0; i < planList.length; i++) {
            titleTextField.insert(i, TextEditingController());
            desTextField.insert(i, TextEditingController());
            planImages.insert(i, planList[i].planImages);

            titleTextField[i].text = planList[i].planTitles;
            desTextField[i].text = planList[i].planDescriptions;
          }
        } else {
          planList.add(const PropertyPlanDto(
              planImages: '', planTitles: '', planDescriptions: ''));
          bloc.add(PropertyPropertyPlanEvent(propertyPlan: planList));
        }
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                width: 0.5,
                color: Colors.black,
              )),
          child: Column(
            children: [
              const FormHeaderTitle(title: "Property Plan"),
              Utils.verticalSpace(8.h),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(
                      planItem,
                      (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (index != 0) ...[
                              GestureDetector(
                                onTap: () async {
                                  print("plan id: ${planList[index].id}");
                                  if (planList[index].id != 0) {
                                    final result =
                                        await updateCubit.deleteSinglePlan(
                                            planList[index].id.toString());

                                    result.fold(
                                      (failure) {
                                        Utils.errorSnackBar(context, failure.errorMessage);
                                      },
                                      (data) {
                                        Utils.showSnackBar(context, "${data.message}");
                                        planList.removeAt(index);
                                        bloc.add(PropertyPropertyPlanEvent(propertyPlan: planList));
                                      },
                                    );
                                  } else {
                                    planList.removeAt(index);
                                    bloc.add(PropertyPropertyPlanEvent(
                                        propertyPlan: planList));
                                  }
                                  setState(() {});
                                },
                                child: const DeleteIconBtn(),
                              ),
                            ],
                            buildImage(index),
                            defaultVerticalSpace,
                            CustomTextField(
                              onChanged: (){}, 
                              hintText: 'Title',
                              labelText: 'Title',
                              keyboardType: TextInputType.text,
                              controller: titleTextField[index],
                            ),
                            defaultVerticalSpace,
                            CustomTextField(
                              onChanged: (){}, 
                              hintText: 'Description',
                              labelText: 'Description',
                              keyboardType: TextInputType.text,
                              controller: desTextField[index],
                            ),
                          ]),
                    ),
                    defaultVerticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            final temp = <PropertyPlanDto>[];
                            for (var i = 0; i < planItem; i++) {
                              temp.insert(
                                  i,
                                  PropertyPlanDto(
                                    planImages: planImages[i],
                                    planTitles: titleTextField[i].text,
                                    planDescriptions: desTextField[i].text,
                                  )
                                );
                              planList = temp;
                              bloc.add(PropertyPropertyPlanEvent(
                                  propertyPlan: planList));
                              print("check plan $planList");
                           
                            }
                            Utils.showSnackBar(context, 'Item Saved');
                            setState(() {});
                          },
                          child: const ItemSaveBtn(),
                        ),
                        GestureDetector(
                          onTap: () {
                            planList.add(const PropertyPlanDto(
                              planImages: '',
                              planTitles: '',
                              planDescriptions: ''
                              )
                            );
                            bloc.add(PropertyPropertyPlanEvent(propertyPlan: planList));
                            setState(() {});
                          },
                          child: const ItemAddBtn(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildImage(int index) {
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        print(" thumnail===========");
        // print();
        final bloc = context.read<PropertyCreateBloc>();

        final imageItem = planList[index].planImages;
        String thumbImage =
            imageItem.isEmpty ? KImages.placeholderImage : imageItem;

        bool isFile = imageItem.isNotEmpty
            ? imageItem.contains('https://')
                ? false
                : true
            : false;

           
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                width: 0.2,
                color: grayColor,
              )),
          child: Column(
            children: [
              if (imageItem.isNotEmpty) ...[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: CustomImage(
                        path: thumbImage,
                        height: 170.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        isFile: isFile,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          final imageSourcePath = await Utils.pickSingleImage();
                          print("image pick path =================================");
                            print(imageSourcePath);
                          if(imageSourcePath != null){
                              planList.removeAt(index);
                              planList.insert(
                              index,
                              PropertyPlanDto(
                                planImages: imageSourcePath,
                                planTitles: titleTextField[index].text,
                                planDescriptions: desTextField[index].text,
                              )
                            );
                            bloc.add(PropertyPropertyPlanEvent(propertyPlan: planList));
                            setState(() {});
                          }
                        },
                        child: const EditBtn()
                      )
                    ),
                  ],
                ),
              ] else ...[
                Container(
                  height: 60.h,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      final imageSourcePath = await Utils.pickSingleImage();
                      if(imageSourcePath != null){
                          planList.removeAt(index);
                          planList.insert(
                          index,
                          PropertyPlanDto(
                            planImages: imageSourcePath,
                            planTitles: titleTextField[index].text,
                            planDescriptions: desTextField[index].text,
                          )
                        );
                        bloc.add(PropertyPropertyPlanEvent(propertyPlan: planList));
                        setState(() {});
                      }
                      // planList.insert(
                      //   index,
                      //   PropertyPlanDto(
                      //     planImages: imageSourcePath!,
                      //     planTitles: titleTextField[index].text,
                      //     planDescriptions: desTextField[index].text,
                      //   )
                      // );
                      // bloc.add(
                      //     PropertyPropertyPlanEvent(propertyPlan: planList));
                      // // print("img $planList");

                      // setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.upload,
                          size: iconSize,
                          color: primaryColor,
                        ),
                        Utils.horizontalSpace(7.w),
                        const CustomTextStyle(
                          fontSize: titleFontSize,
                          text: "Upload Plan Images",
                          fontWeight: FontWeight.w600,
                            color: primaryColor,
                        ),
                        
                      ],
                    ),
                  ),
                ),

              ]
            ],
          ),
        );
      },
    );
  }
}
