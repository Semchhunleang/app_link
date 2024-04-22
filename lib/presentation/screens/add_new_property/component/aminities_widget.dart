import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../widget/form_header_title.dart';

class AminitiesWidget extends StatefulWidget {
  const AminitiesWidget({super.key});

  @override
  State<AminitiesWidget> createState() => _AminitiesWidgetState();
}

class _AminitiesWidgetState extends State<AminitiesWidget> {
  bool isChecked = false;

  // final tempAminityList = <int>[];
  List<int> aminityList = <int>[];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    final cubit = context.read<CreateInfoCubit>();
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        state.aminities;
        if (state.aminities.isNotEmpty) {
          aminityList = state.aminities;
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 0.5,
              color: Colors.black,
            )
          ),
          
          child: Column(
            children: [
              const FormHeaderTitle(title: "Aminities"),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Wrap(
                  runSpacing: 10.h,
                  spacing: 15.w,
                  children: [
                    ...List.generate(cubit.createPropertyInfo.aminities.length,
                        (index) {
                      final element = cubit.createPropertyInfo.aminities[index];
                      return SizedBox(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: grayColor,
                            ),
                            child: Transform.scale(
                              // scale: isIpad ? checkBoxSize : 1,
                              scale: 1,
                              child: Checkbox(
                                value: aminityList.contains(element.id),
                                activeColor: primaryColor,
                                onChanged: (v) {
                                  setState(() {
                                    if (aminityList.contains(element.id)) {
                                      final findIndex = aminityList.indexWhere((e) => e == element.id);
                                      aminityList.removeAt(findIndex);
                                    } else {
                                      aminityList.add(element.id);
                                    }
                                  });
                                  bloc.add(PropertyPropertyAminitiesEvent(
                                    propertyAminities: aminityList));
                                }),
                            ),
                          ),
                          Text(element.aminity, style: const TextStyle(fontSize:  textFieldSize),),
                        ],
                      ));
                    })
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
