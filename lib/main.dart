import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/firebase_options.dart';
import 'package:real_estate/presentation/screens/authentication/login_screen.dart';
import 'package:real_estate/presentation/screens/authentication/sing_up_screen.dart';
import 'package:real_estate/presentation/screens/main_page/main_page_scree.dart';
import 'package:real_estate/presentation/screens/splash/splash_screen.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '/presentation/utils/k_strings.dart';
import 'presentation/router/route_names.dart';
import 'presentation/utils/firebase_dynamic_link_helper.dart';
import 'presentation/widget/custom_theme.dart';
import 'state_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await StateInjector.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const RealEstate());
  // runApp(
  //   const MaterialApp(
  //     initialRoute: "/",
  //     home: Scaffold(
  //       body: Text("Hello world"),
  //     ),
  //   ),
  // );
}

class RealEstate extends StatefulWidget {
  const RealEstate({Key? key}) : super(key: key);

  @override
  State<RealEstate> createState() => _RealEstateState();
}

class _RealEstateState extends State<RealEstate> {
  @override
  void initState() {
    super.initState();
    FirebaseDynamicLinkHelper.initDynamicLinks(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: StateInjector.repositoryProviders,
          child: MultiBlocProvider(
            providers: StateInjector.blocProviders,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: KString.appName,
              theme: CustomTheme.theme,
              onGenerateRoute: RouteNames.generateRoutes,
              initialRoute: RouteNames.splashScreen,
              // routes: {
              //   '/': (context) => const SplashScreen(),
              //   '/login': (context) => const LoginScreen(),
              //   '/register': (context) => const SingUpScreen(),
              //   // Add other named routes as needed
              // },
              // initialRoute: '/',
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child!,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
