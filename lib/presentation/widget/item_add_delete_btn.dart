import 'package:real_estate/state_inject_package_names.dart';
import '../utils/constraints.dart';

class ItemAddBtn extends StatelessWidget {
  const ItemAddBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonIconSize,
      width: buttonIconSize,
      margin: EdgeInsets.all(8.w),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: const Icon(
        Icons.add,
        color: whiteColor,
        size: iconSize,
      ),
    );
  }
}

class ItemSaveBtn extends StatelessWidget {
  const ItemSaveBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonIconSize,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.w),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      decoration: BoxDecoration(
        color: yellowColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: const Text("Save",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: detailFontSize,fontWeight: FontWeight.w600,color: blackColor),),
    );
  }
}


class DeleteIconBtn extends StatelessWidget {
  const DeleteIconBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonIconSize,
      width: buttonIconSize,
      margin: EdgeInsets.all(8.h),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: const Icon(
        Icons.delete,
        size: iconSize,
        color: whiteColor,
      ),
    );
  }
}
