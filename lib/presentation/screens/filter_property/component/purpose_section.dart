import 'package:real_estate/state_inject_package_names.dart';
import '../../../core/dummy_text.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';

class PurposeSection extends StatelessWidget {
  const PurposeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterPropertyCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextStyle(
          text: 'Purpose',
          fontSize: titleFontSize,
        ),
        SizedBox(height: 10.h),
        DropdownButtonFormField<DummyPurpose>(
          // itemHeight: isIpad ? selectBoxHeight :null,
          isDense: true,
          isExpanded: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: borderColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
          ),
          value: dummyPurpose.first,
          hint: const CustomTextStyle(
            text: 'Select Purpose',
            fontWeight: FontWeight.w400,
            fontSize: textFieldSize,
          ),
          icon: const Icon(Icons.keyboard_arrow_down_sharp, color: blackColor),
          items: dummyPurpose
              .map<DropdownMenuItem<DummyPurpose>>(
                (e) => DropdownMenuItem(
                  value: e,
                  child: CustomTextStyle(
                    text: e.title,
                    fontSize: textFieldSize,
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {
            if (val == null) return;
            String title = val.title
                .toLowerCase()
                .replaceAll(' ', '')
                .replaceAll('for', '');
            //print(title);
            filterCubit.purposeChange(title);
          },
        ),
      ],
    );
  }
}
