import 'package:real_estate/data/model/create_property/additional_info_dto.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../utils/utils.dart';
import '../../../widget/form_header_title.dart';
import '../../../widget/item_add_delete_btn.dart';

class AdditionalWidget extends StatefulWidget {
  const AdditionalWidget({super.key});

  @override
  State<AdditionalWidget> createState() => _AdditionalWidgetState();
}

class _AdditionalWidgetState extends State<AdditionalWidget> {
  int additionalItem = 1;
  final keyField = <TextEditingController>[TextEditingController()];
  final valueFiled = <TextEditingController>[TextEditingController()];
  List<AdditionalInfoDto> addInfoList = <AdditionalInfoDto>[];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        final updateCubit = context.read<UpdateCubit>();
        if (state.addtionalInfoList.isNotEmpty) {
          addInfoList = state.addtionalInfoList;
          additionalItem = state.addtionalInfoList.length;

          for (var i = 0; i < addInfoList.length; i++) {
            keyField.insert(i, TextEditingController());
            valueFiled.insert(i, TextEditingController());

            keyField[i].text = state.addtionalInfoList[i].addKeys;
            valueFiled[i].text = state.addtionalInfoList[i].addValues;
          }
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
              const FormHeaderTitle(title: "Additional Information"),
              Utils.verticalSpace(8.h),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: BlocBuilder<CreateInfoCubit, CreateInfoState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ...List.generate(
                          additionalItem,
                          (index) => Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (index != 0) ...[
                                GestureDetector(
                                  onTap: () async {
                                    if (addInfoList[index].id != 0) {
                                      final result =
                                          await updateCubit.deleteSingleAddInfo(
                                              addInfoList[index].id.toString());
                                      result.fold(
                                        (failure) {
                                          Utils.errorSnackBar(context, failure.errorMessage);
                                        },
                                        (data) {
                                          Utils.showSnackBar(context, "$data");
                                          addInfoList.removeAt(index);
                                          bloc.add(PropertyAdditionalInfoEvent(
                                              additionalInfo: addInfoList));
                                        },
                                      );
                                    } else {
                                      addInfoList.removeAt(index);
                                      bloc.add(PropertyAdditionalInfoEvent(
                                          additionalInfo: addInfoList));
                                    }
                                    setState(() {});
                                  },
                                  child: const DeleteIconBtn(),
                                ),
                              ],
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'Key',
                                      labelText: 'Key',
                                      controller: keyField[index],
                                      onChanged: (){
                                      },
                                      keyboardType: TextInputType.text,
                                    )
                                  ),
                                  Utils.horizontalSpace(10.h),
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'Value',
                                      labelText: 'Value',
                                      controller: valueFiled[index],
                                       keyboardType: TextInputType.text,
                                      onChanged: (){
                                        
                                      },
                                    )
                                    // child: TextFormField(
                                    //   controller: valueFiled[index],
                                    //   // textInputAction: TextInputAction.done,
                                    //   // onChanged: (v) {},

                                    //   decoration: const InputDecoration(
                                    //       hintText: 'Value',
                                    //       labelText: 'Value',
                                    //       hintStyle:
                                    //           TextStyle(color: Colors.black38),
                                    //       labelStyle: TextStyle(
                                    //         color: Colors.black38,
                                    //       )),
                                    //   keyboardType: TextInputType.text,
                                    // ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Utils.verticalSpace(14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                final temp = <AdditionalInfoDto>[];
                                for (var i = 0; i < additionalItem; i++) {
                                  temp.insert(
                                    i,
                                    AdditionalInfoDto(
                                      addKeys: keyField[i].text,
                                      addValues: valueFiled[i].text,
                                    ),
                                  );
                                }
                                addInfoList = temp;

                                bloc.add(PropertyAdditionalInfoEvent(
                                    additionalInfo: addInfoList));

                                print("addInfo: $addInfoList");
                                Utils.showSnackBar(context, 'Item Saved');
                                setState(() {});
                              },
                              child: const ItemSaveBtn(),
                            ),
                            GestureDetector(
                              onTap: () {
                                addInfoList.add(const AdditionalInfoDto(
                                    addKeys: '', addValues: ''));
                                bloc.add(PropertyAdditionalInfoEvent(
                                    additionalInfo: addInfoList));

                                setState(() {});
                              },
                              child: const ItemAddBtn(),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
