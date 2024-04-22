import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5.h),
      child: Text(
        "$text*",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.red,
          fontSize: detailFontSize,
        ),
      ),
    );
  }
}
