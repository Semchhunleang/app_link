import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';


class RempIconButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color colorIcon;
  final Color bgColor;
  final bool isPaddingLeft;
  const RempIconButton({super.key, required this.onTap, required this.icon, required this.colorIcon, this.bgColor = primaryColor, this.isPaddingLeft = false});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => onTap(),
      child: CircleAvatar(
        backgroundColor: bgColor,
        minRadius:isPaddingLeft ? 10: 15,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: isPaddingLeft? 7:0),
              child: Icon(
                icon,
                color: colorIcon,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BtnCycleBack extends StatelessWidget {
  final bool isBackGroundWhite;
  final Function? onTap;
  const BtnCycleBack({super.key, this.isBackGroundWhite= false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.of(context).pop();
         onTap?.call();
      },
      child: CircleAvatar(
        backgroundColor: isBackGroundWhite ?whiteColor: primaryColor,
        minRadius: 17,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(
            Icons.arrow_back_ios,
            color:isBackGroundWhite ?grayColor:whiteColor,
            size: iconSize
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color? iconColor;
  const CustomButton({super.key, required this.onTap, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Card(
        elevation: 1.5,
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.h),
        ),
        child: Padding(
          padding: EdgeInsets.all(9.h),
          child: Icon(icon, color: iconColor?? primaryColor, size: iconSize),
        ),
      ),
    );
  }
}
