import 'package:real_estate/presentation/router/route_packages_name.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class SingleBrokerAgentCartView extends StatelessWidget {
  const SingleBrokerAgentCartView({Key? key, required this.agent})
      : super(key: key);
  final UserProfileModel agent;

  @override
  Widget build(BuildContext context) {

    final defaultImage =
        context.read<AppSettingCubit>().settingModel!.setting.defaultAvatar;
    final image = agent.image.isNotEmpty ? agent.image : defaultImage;
    //final image = agent.image;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.agentProfileScreen,
            arguments: agent.userName);
        //print(agent.userName);
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 0.0),
        // padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: CustomImage(
                path: image == "" ? "assets/images/agent.png" : image,
                width: double.infinity,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: propertyCardPadding, top: propertyCardPadding - 5),
              child: CustomTextStyle(
                text: agent.name,
                fontWeight: FontWeight.w600,
                fontSize: titleFontSize,
                color: blackColor,
                maxLine: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: propertyCardPadding, right: 10.0, bottom: propertyCardPadding),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextStyle(
                      text: agent.designation.isNotEmpty
                          ? agent.designation
                          : 'Your Designation',
                      fontWeight: FontWeight.w400,
                      fontSize: detailFontSize,
                      color: grayColor,
                      maxLine: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
