import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/primary_button.dart';

class PropertyDetailNavBar extends StatelessWidget {
  const PropertyDetailNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appSetting = context.read<AppSettingCubit>();
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final agent = state.singlePropertyModel.propertyAgent;
          return Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height * 0.11,
            // padding: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Padding(
                   padding: EdgeInsets.only(left: isIpad? 20:7, right:isIpad? 15: 10, top: size.height * 0.015),
                  child: ClipOval(
                    child: CustomImage(
                      path: agent!.image != ""
                          ? agent.image
                          : appSetting.settingModel!.setting.defaultAvatar,
                      height: size.height * 0.08,
                      width: size.height * 0.08,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5,),
                      CustomTextStyle(
                        text: agent.name,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                        maxLine: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 5),
                        child: CustomTextStyle(
                          text: agent.designation,
                          fontSize: detailFontSize,
                          fontWeight: FontWeight.w400,
                          color: whiteColor,
                          maxLine: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ContactButton(
                    //   onPressed: (){},
                    //   // onPressed: () => Navigator.pushNamed(
                    //   //     context, RouteNames.sendMessageScreen,
                    //   //     arguments: agent.email),
                    //   bgColor: yellowColor,
                    //   text: 'Message',
                    //   icon: KImages.messageIcon,
                    //   iconTextColor: blackColor,
                    // ),
                    // ContactButton(
                    //   onPressed: () async {
                    //     Uri uri = Uri(
                    //         scheme: 'mailto',
                    //         path: agent.email,
                    //         queryParameters: {'subject': 'Example'});
                    //     try {
                    //       if (agent.email.isNotEmpty) {
                    //         await launchUrl(uri);
                    //       } else {
                    //         Utils.showSnackBar(context, 'Email is Empty');
                    //       }
                    //     } catch (e) {
                    //       Utils.showSnackBar(context, e.toString());
                    //     }
                    //   },
                    //   bgColor: blackColor,
                    //   text: 'Email',
                    //   icon: KImages.emailIcon,
                    //   iconTextColor: whiteColor,
                    // ),
                    RempIconButton(
                      onTap: () => Navigator.pushNamed(
                          context, RouteNames.sendMessageScreen,
                          arguments: agent.email),
                      bgColor: colorMiddleBlue,
                      icon: Icons.message_outlined,
                      colorIcon: blackColor,
                    ),
                    Utils.horizontalSpace(8),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: RempIconButton(
                        onTap: () async {
                          Uri uri = Uri(scheme: 'tel', path: agent.phone);
                          //print(uri.runtimeType);
                          if (agent.phone.isNotEmpty) {
                            launchUrl(uri);
                          } else {
                            Utils.showSnackBar(
                                context, 'Phone number is Empty');
                          }
                        },
                        bgColor: yellowColor,
                        icon: Icons.call,
                        colorIcon: blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  messageDialog(BuildContext context) {
    const spacer = SizedBox(height: 12.0);
    Utils.showCustomDialog(
      context,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextStyle(
                    text: 'Write Message',
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                    color: blackColor,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const CustomImage(path: KImages.cancelIcon))
                ],
              ),
              const SizedBox(height: 14.0),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                keyboardType: TextInputType.name,
              ),
              spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Description'),
                keyboardType: TextInputType.multiline,
                maxLines: 4,
              ),
              const SizedBox(height: 20.0),
              PrimaryButton(
                  text: 'Send Message',
                  onPressed: () => Navigator.of(context).pop(),
                  textColor: blackColor,
                  fontSize: titleFontSize,
                  borderRadiusSize: radius,
                  bgColor: yellowColor)
            ],
          ),
        ),
      ),
    );
  }
}
