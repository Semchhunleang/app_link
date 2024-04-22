import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';

class CustomTextField extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int maxLines;
  const CustomTextField({super.key, required this.onChanged, required this.hintText, this.controller, this.initialValue, this.keyboardType, this.prefixIcon, this.suffixIcon, this.obscureText = false, this.maxLines = 1, this.labelText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      style: textFieldStyle,
      decoration: InputDecoration(
        hintText: hintText,
        labelText:labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        floatingLabelStyle: floatingLabelStyle
        // contentPadding: EdgeInsets.symmetric(vertical: 13.5.h, horizontal: 15.w),
      ),
      onChanged: (String name)=> onChanged(name),
      initialValue: initialValue,
    );
  }
}

