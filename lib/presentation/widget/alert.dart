
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/presentation/utils/constraints.dart';

alertMsg({required BuildContext context, String title = "Alert Message", String content ="Message content.", String btnName = "Ok" }) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Platform.isIOS ?
      CupertinoAlertDialog(
        title: Text(title, style: const TextStyle(fontSize: titleFontSize, color: Colors.red),),
        content: Container(
          alignment: Alignment.center,
          child: errorText(
            text: content,
          )
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: errorText(text: btnName),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ):
      AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontFamily: "khmerMuol", fontSize: subtitleFontSize, color: Colors.red),
        ),
        content: Container(
          child: errorText(
            text: content,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: <Widget>[
          TextButton(
            child: errorText(
              text: btnName,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// class CredTextBtn extends StatelessWidget {
//   final bool isBtnGreen;
//   final String btnName;
//   final Function onPressed;
//   const CredTextBtn({Key? key, required this.isBtnGreen, required this.btnName, required this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  TextButton(
//       style: TextButton.styleFrom(
//         foregroundColor: mainColor,
//         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         fixedSize: Size(27.5.wp, GetPlatform.isIOS? 10.0.wp:5.5.wp),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: isBtnGreen ? green:grey,
//             width: 1.8,
//             style: BorderStyle.solid),
//           borderRadius: BorderRadius.circular(100)),
//       ),
//       onPressed: (){
//         onPressed();
//       },
//       child: Text(
//         btnName.tr,
//         style: TextStyle(
//           color: isBtnGreen ? green:grey,
//           fontFamily: "osContent",
//           fontSize: 10.0.sp
//         ),
//       ),
//     );
//   }
// }

// Style for text error
Widget errorText({String text = "", isWhite = false, double fontSize=14}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: isWhite ? whiteColor : Colors.red,
      fontFamily: "osContent",
    ),
  );
}