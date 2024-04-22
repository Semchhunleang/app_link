import '../../data/model/auth/form_number_phone.dart';
import '../../data/model/auth/mix_model_old_new_user.dart';
import '../../data/model/online_payment/agrument_product_model.dart';
import '../screens/add_new_property/update_screen.dart';
import '../screens/invite_and_earn/detail_apier.dart';
import '../screens/online_payment/subscription_product_screen.dart';
import 'route_packages_name.dart';

class RouteNames {
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onboarding';
  static const String loginScreen = '/login';
  static const String signUpScreen = '/register';
  static const String otpScreen = '/otp_screen';
  static const String forgotPasswordScreen = '/forgot_password';
  static const String verificationScreen = '/verification_screen';
  static const String updatePasswordScreen = '/update_password';
  static const String homeScreen = '/home';
  static const String mainPageScreen = '/main_page';
  static const String allCategoryScreen = '/allCategoryScreen';
  static const String allPropertyScreen = '/allPropertyScreen';
  static const String urgentPropertyScreen = '/urgentPropertyScreen';
  static const String allRecommendedPropertyScreen =
      '/allRecommendedPropertyScreen';
  static const String allBrokerAgentListScreen = '/allBrokerAgentListScreen';
  static const String agentProfileScreen = '/agentProfileScreen';
  static const String sendMessageScreen = '/sendMessageScreen';
  static const String profileScreen = '/profileScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String propertyDetailsScreen = '/propertyDetailsScreen';
  static const String myDealsScreen = '/myDealsScreen';
  static const String mySavedScreen = '/mySavedScreen';
  static const String inviteAndEarnScreen = '/inviteAndEarnScreen';
  static const String inviteEarnBalance = '/inviteEarnBalance';
  static const String allSettingScreen = '/allSettingScreen';
  static const String choosePropertyOptionScreen =
      '/choosePropertyOptionScreen';
  static const String addNewPropertyScreen = '/addNewPropertyScreen';
  static const String reviewScreen = '/reviewScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String paymentMethodScreen = '/paymentMethodScreen';

  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsAndConditionScreen = '/termsAndConditionScreen';
  static const String faqScreen = '/faqScreen';
  static const String premiumMembershipScreen = '/premiumMembershipScreen';
  static const String contactUsScreen = '/contactUsScreen';
  static const String purchaseScreen = '/purchaseScreen';
  static const String purchaseDetailsScreen = '/purchaseDetailsScreen';
  static const String searchScreen = '/searchScreen';
  static const String updateScreen = '/updateScreen';
  static const String filterPropertyScreen = '/filterPropertyScreen';

//payment string
  static const String bankPaymentScreen = '/bankPaymentScreen';
  static const String stripePaymentScreen = '/stripePaymentScreen';
  static const String flutterWavePaymentScreen = '/flutterWavePaymentScreen';
  static const String payStackPaymentScreen = '/payStackPaymentScreen';
  static const String molliPaymentScreen = '/molliPaymentScreen';
  static const String instamojoPaymentScreen = '/instamojoPaymentScreen';
  static const String razorpayPaymentScreen = '/razorpayPaymentScreen';
  static const String paypalPaymentScreen = '/paypalPaymentScreen';
  static const String viewProfileInfo = '/viewProfileInfo';
  static const String subscriptionProductScreen = '/subscriptionProductScreen';

  static const String detailApier = '/detailApier';
  static const String successPayment = '/successPayment';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());

      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OnBoardingScreen());

      case RouteNames.loginScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());

      case RouteNames.signUpScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SingUpScreen());

      case RouteNames.otpScreen:
        final formNumberPhone = settings.arguments as FormNumberPhone;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => OtpScreen(
                  formNumberPhone: formNumberPhone,
                ));
      case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ForgotPasswordScreen());

      case RouteNames.verificationScreen:
        final isVerification = settings.arguments as bool;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => VerificationScreen(isVerification: isVerification));

      case RouteNames.updatePasswordScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const UpdatePasswordScreen());

      case RouteNames.homeScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());

      case RouteNames.mainPageScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MainPageScreen());

      case RouteNames.allCategoryScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AllCategoryScreen());

      case RouteNames.allPropertyScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AllPropertyListScreen());

      case RouteNames.urgentPropertyScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const UrgentPropertyListScreen());

      case RouteNames.allRecommendedPropertyScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const AllRecommendedProperties());
      case RouteNames.allBrokerAgentListScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const AllBrokerAgentListScreen());

      case RouteNames.agentProfileScreen:
        String userName = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => AgentProfileScreen(userName: userName));

      case RouteNames.sendMessageScreen:
        String agentEmail = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SendMessageScreen(agentEmail: agentEmail));

      case RouteNames.profileScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ProfileScreen());

      case RouteNames.viewProfileInfo:
        final userInfo = settings.arguments as MixModelOldNewUser;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => ViewProfileInfo(
                  profile: userInfo.userDataModel,
                  userModel: userInfo.userProfileModel,
                ));

      case RouteNames.updateProfileScreen:
        final profile = settings.arguments as UserProfileModel;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => UpdateProfileScreen(profile: profile));

      case RouteNames.propertyDetailsScreen:
        final slug = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => PropertyDetailScreen(slug: slug));

      case RouteNames.myDealsScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MyDealsScreen());

      case RouteNames.mySavedScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MySavedScreen());

      case RouteNames.inviteAndEarnScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const InviteAndEarnScreen());

      case RouteNames.inviteEarnBalance:
        return MaterialPageRoute(
            settings: settings, builder: (_) => InvitedEarnBalance());

      case RouteNames.allSettingScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AllSettingScreen());

      case RouteNames.addNewPropertyScreen:
        final slug = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => AddNewPropertyScreen(
                  purpose: slug,
                ));

      case RouteNames.updateScreen:
        final id = settings.arguments as int;
        return MaterialPageRoute(
            settings: settings, builder: (_) => UpdateScreen(id: id));

      case RouteNames.choosePropertyOptionScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const ChoosePropertyOptionScreen());

      case RouteNames.reviewScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ReviewScreen());
      case RouteNames.aboutUsScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => AboutUsScreen());

      case RouteNames.paymentMethodScreen:
        final planSlug = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => PaymentMethodScreen(planSlug: planSlug));

      case RouteNames.bankPaymentScreen:
        final String planSlug = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => BankPaymentScreen(planSlug: planSlug));

      case RouteNames.stripePaymentScreen:
        final String planSlug = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => StripePaymentScreen(planSlug: planSlug));

      case RouteNames.flutterWavePaymentScreen:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings, builder: (_) => FlutterWaveScreen(url: url));

      case RouteNames.molliPaymentScreen:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings, builder: (_) => MolliPaymentScreen(url: url));

      case RouteNames.instamojoPaymentScreen:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => InstamojoPaymentScreen(url: url));

      case RouteNames.razorpayPaymentScreen:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => RazorpayPaymentScreen(url: url));

      case RouteNames.paypalPaymentScreen:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings, builder: (_) => PaypalPaymentScreen(url: url));

      case RouteNames.payStackPaymentScreen:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => PayStackPaymentScreen(url: url));

      case RouteNames.privacyPolicyScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PrivacyPolicyScreen());

      case RouteNames.termsAndConditionScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const TermsAndConditionScreen());

      case RouteNames.faqScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const FaqScreen());

      case RouteNames.premiumMembershipScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const PremiumMembershipScreen());
      case RouteNames.subscriptionProductScreen:
        final ArgumentProductModel argumentProductModel =
            settings.arguments as ArgumentProductModel;
        //  final int id = settings.arguments as int;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SubScriptionProductScreen(
                  argumentProductModel: argumentProductModel,
                ));
      case RouteNames.contactUsScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ContactUsScreen());
      case RouteNames.purchaseScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PurchaseScreen());
      case RouteNames.purchaseDetailsScreen:
        final orderId = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => PurchaseDetailScreen(orderId: orderId));

      case RouteNames.searchScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SearchScreen());

      case RouteNames.filterPropertyScreen:
        final type = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => FilterPropertyScreen(type: type));

      case RouteNames.detailApier:
        final data = settings.arguments as Map;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DetailApier(
                  startDate: data['startDate'],
                  endDate: data['endDate'],
                  depth: data['depth'],
                  level: data['level'],
                ));

      case RouteNames.successPayment:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SuccessPayment());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
