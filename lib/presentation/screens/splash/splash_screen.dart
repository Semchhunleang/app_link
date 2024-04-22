import 'package:go_router/go_router.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../router/route_names.dart';
import 'components/setting_error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SettingCubit>().getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appSettingBloc = context.read<AppSettingCubit>();
    final loginBloc = context.read<LoginBloc>();
    final agentProfileCubit = context.read<ProfileCubit>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Splash'),
      // ),
      body: BlocConsumer<AppSettingCubit, AppSettingState>(
        listener: (context, state) {
          //Navigator.pushReplacementNamed(context, RouteNames.successPayment);
          //  Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          if (state is AppSettingStateLoaded) {
            if (loginBloc.isLogedIn) {
              //----- add status to check UnAuthenticated in splash screen -------
              context.read<ProfileCubit>().getAgentDashboardInfo();
              context.read<ProfileCubit>().getAgentProfile();
              context.read<ProfileCubit>().getUserProfile().then((value) {
                if (agentProfileCubit.statusCode == 401) {
                  context.go('/login');
                } else {
                  context.go('/login');
                }
                // debugPrint("------------- above splash line 1 : $statusCode");
              });
              // debugPrint(
              //     "------------- above splash line 2 : ${agentProfileCubit.statusCode}");

              // Navigator.pushReplacementNamed(
              //     context, RouteNames.mainPageScreen);

              // debugPrint(
              //     "============= splash line 1: ${loginBloc.userInfo!.tokenModel.accessToken}");
            } else if (appSettingBloc.isOnBoardingShown) {
              context.go('/login');
              debugPrint("============= splash line 2 : ");
            } else {
              context.go('/login');
              debugPrint("============= splash line 3 : ");
            }
          }
        },
        builder: (context, state) {
          if (state is AppSettingStateError) {
            return SettingErrorWidget(message: state.meg);
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              const CustomImage(path: KImages.splashImage, fit: BoxFit.cover),
              Positioned(
                top: size.height * 0.2,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    CustomImage(path: KImages.logo, width: 1.sw * .3),
                    SizedBox(height: 5.h),
                    CustomTextStyle(
                      text: 'REMP',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                      fontSize: isIpad ? 30 : 22,
                      color: whiteColor,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
