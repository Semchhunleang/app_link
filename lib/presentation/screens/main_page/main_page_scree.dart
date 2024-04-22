import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/logic/cubit/apier/apier_cubit.dart';
import 'package:real_estate/presentation/screens/invite_and_earn/invite_and_earn_screen.dart';
import 'package:real_estate/presentation/screens/wallet/wallet.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/utils/utils.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../logic/cubit/about_us/about_us_cubit.dart';
import '../../../logic/cubit/agent/agent_cubit.dart';
import '../../../logic/cubit/contact_us/contact_us_cubit.dart';
import '../../../logic/cubit/create_property/create_info_cubit.dart';
import '../../../logic/cubit/filter_property/filter_property_cubit.dart';
import '../../../logic/cubit/payment/price_plan/price_plan_cubit.dart';
import '../../../logic/cubit/privacy_policy/privacy_policy_cubit.dart';
import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../../logic/cubit/wishlist/wishlist_cubit.dart';
import '../../router/route_names.dart';
import '../all_settings/all_settings_screen.dart';
import '../home/home_screen.dart';
import '../my_saved/my_saved_screen.dart';
import 'component/bottom_navigation_bar.dart';
import 'component/main_controller.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final _homeController = MainController();
  late List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = [
      const HomeScreen(),
      //const MyDealsScreen(),
      const MySavedScreen(),
      const InviteAndEarnScreen(),
      const WalletScreen(),
      const AllSettingScreen(),
      // const OrderScreen(),
      // Container(),
    ];
    //----- add check conditon of UnAuthenticated in main page screen -------
    final wishlistCubit = context.read<WishlistCubit>();
    context.read<ProfileCubit>().getAgentProfile();
    context.read<ProfileCubit>().getUserProfile();
    context.read<WishlistCubit>().getWishListProperties().then((value) {
      if (wishlistCubit.statusCode == 401) {
        Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
      }
      context.read<PrivacyPolicyCubit>().getFaqContent();
      context.read<PrivacyPolicyCubit>().getTermsAndCondition();
      context.read<PrivacyPolicyCubit>().getPrivacyPolicy();
      context.read<ContactUsCubit>().getContactUs();
      context.read<AboutUsCubit>().getAboutUs();
      context.read<AgentCubit>().getAllAgent();
      context.read<PricePlanCubit>().getPricePlan();
      context.read<FilterPropertyCubit>().getAllProperty();
      context.read<CreateInfoCubit>().getPropertyChooseInfo();
      context.read<ProfileCubit>().getAgentDashboardInfo();
      context.read<ApierCubit>().getFilterOption();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exitApp(context);
        return true;
      },
      child: Scaffold(
        body: StreamBuilder<int>(
          initialData: 0,
          stream: _homeController.naveListener.stream,
          builder: (context, AsyncSnapshot<int> snapshot) {
            int item = snapshot.data ?? 0;
            return screenList[item];
          },
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }

  exitApp(BuildContext context) async {
    Utils.showCustomDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: KImages.logoutIcon),
            const SizedBox(height: 10.0),
            const CustomTextStyle(
              textAlign: TextAlign.center,
              text: 'Are you sure\nYou want to Exit?',
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoutButton(
                    'No', () => Navigator.of(context).pop(), blackColor),
                const SizedBox(width: 14.0),
                logoutButton('Exit', () => SystemNavigator.pop(), primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton(String text, VoidCallback onPressed, Color bgColor) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100.0, 40.0)),
          backgroundColor: MaterialStateProperty.all(bgColor),
          elevation: MaterialStateProperty.all(0.0),
          shadowColor: MaterialStateProperty.all(transparent),
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadius))),
      child: CustomTextStyle(
        text: text,
        fontWeight: FontWeight.w500,
        fontSize: titleFontSize,
        color: whiteColor,
      ),
    );
  }
}
