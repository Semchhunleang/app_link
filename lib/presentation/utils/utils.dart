import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/presentation/utils/k_strings.dart';
import 'package:timeago/timeago.dart' as timeago;

import '/presentation/widget/custom_test_style.dart';
import '../../logic/cubit/setting/app_setting_cubit.dart';
import '../widget/custom_images.dart';
import 'constraints.dart';
import 'k_images.dart';

class Utils {
  static final _selectedDate = DateTime.now();

  static final _initialTime = TimeOfDay.now();

  static String formatPrice(BuildContext context, var price) {
    final currency =
        context.read<AppSettingCubit>().settingModel!.setting.currencyIcon;
    if (price is double) return '$currency${price.toStringAsFixed(1)}';
    if (price is String) {
      final p = double.tryParse(price) ?? 0.0;
      return '$currency${p.toStringAsFixed(1)}';
    }
    return price.toStringAsFixed(1);
  }

  static String formatPriceIcon(BuildContext context, var price) {
    final currency =
        context.read<AppSettingCubit>().settingModel!.setting.currencyIcon;
    if (price is double) return currency + price.toStringAsFixed(1);
    if (price is String) {
      final p = double.tryParse(price) ?? 0.0;
      return currency + p.toStringAsFixed(1);
    }
    return currency + price.toStringAsFixed(1);
  }

  static Future<String?> pickSingleImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    }
    return null;
  }

  static Future<List<String>> pickMultipleImage() async {
    final ImagePicker picker = ImagePicker();
    final List<String> imageList = [];
    final List<XFile?> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      // imageList.addAll(images);
      //  return images.map((e) => imageList.add(e!.path)).toList();
      for (var i in images) {
        imageList.add(i!.path.toString());
      }
      debugPrint('picked images: ${imageList.length}');
      return imageList;
    }
    return [];
  }


  static String formatDate(var date) {
    late DateTime _dateTime;
    if (date is String) {
      _dateTime = DateTime.parse(date);
    } else {
      _dateTime = date;
    }

    // return DateFormat.MMMEd().format(_dateTime.toLocal());
    return DateFormat.yMMMMd().format(_dateTime.toLocal());
  }

  static String timeAgo(String? time) {
    try {
      if (time == null) return '';
      return timeago.format(DateTime.parse(time));
    } catch (e) {
      return '';
    }
  }

  static String convertToAgo(String? time) {
    Duration diff = DateTime.now().difference(DateTime.parse(time!));

    try {
      if (diff.inDays >= 1) {
        return '${diff.inDays} days ago';
      } else if (diff.inHours >= 1) {
        return '${diff.inHours} hours ago';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minutes ago';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} seconds ago';
      } else {
        return 'Just Now';
      }
    } catch (e) {
      return '';
    }
  }

  static Widget verticalSpace(double size) {
    return SizedBox(height: size.h);
  }

  static Widget horizontalSpace(double size) {
    return SizedBox(width: size.h);
  }

  static double toDouble(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static double toInt(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static Future<DateTime?> selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2050),
      );

  static Future<TimeOfDay?> selectTime(BuildContext context) =>
      showTimePicker(context: context, initialTime: _initialTime);

  static void closeKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void appInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            KString.appTitle,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: blackColor, fontSize: detailFontSize),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoLabel(label: 'Name', text: KString.appName),
              SizedBox(height: 6.h),
              const InfoLabel(label: 'Version', text: KString.appVersion),
              SizedBox(height: 6.h),
              const InfoLabel(label: 'Developed by', text: KString.appDeveloper),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: CustomTextStyle(
                text: 'Dismiss',
                fontWeight: FontWeight.w500,
                color: primaryColor,
                // fontSize: 1.sw > dWidthSize ? 10.sp - 10: 12.sp,
                fontSize: titleFontSize,
              ),
            ),
          ],
        );
      },
    );
  }

  static loadingDialog(
    BuildContext context, {
    bool barrierDismissible = false,
  }) {
    // closeDialog(context);
    showCustomDialog(
      context,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: primaryColor),
              SizedBox(width: 15),
              Text('Please wait a moment')
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static loading() {
    return const Center(child: CircularProgressIndicator(color: primaryColor,));
  }

  static bool _isDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  static void closeDialog(BuildContext context) {
    if (_isDialogShowing(context)) {
      Navigator.pop(context);
    }
  }

  static Future showCustomDialog(
    BuildContext context, {
    Widget? child,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        );
      },
    );
  }

  static void errorSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(errorMsg, style: const TextStyle(color: Colors.red)),
        ),
      );
  }

  static void showSnackBar(BuildContext context, String msg,
      [Color textColor = whiteColor]) {
    final snackBar = SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text(msg, style: TextStyle(color: textColor)));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void serviceUnAvailable(BuildContext context, String msg,
      [Color textColor = Colors.white]) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 500),
        content: Text(msg, style: TextStyle(color: textColor)));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showSnackBarWithAction(
      BuildContext context, String msg, VoidCallback onPress,
      [Color textColor = primaryColor]) {
    final snackBar = SnackBar(
      content: Text(msg, style: TextStyle(color: textColor)),
      action: SnackBarAction(
        label: 'Active',
        onPressed: onPress,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static defaultIcon(BuildContext context) {
    final icon = context.read<AppSettingCubit>().settingModel!.setting.logo;
    return CustomImage(
      path: icon == ""? KImages.logo:icon,
      height: 70.h,
      width: 70.h,
    );
  }
}

class InfoLabel extends StatelessWidget {
  const InfoLabel({
    Key? key,
    this.label,
    this.text,
  }) : super(key: key);
  final String? label;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "${label!} : ",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400, color: blackColor, 
          fontSize: titleFontSize,
          ),
        children: [
          TextSpan(
            text: text!,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: blackColor,
              fontSize: detailFontSize,
              ),
          )
        ],
      ),
    );
  }
}


