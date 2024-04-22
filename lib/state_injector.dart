import 'package:real_estate/logic/cubit/apier/apier_cubit.dart';
import 'package:real_estate/logic/cubit/apier/detail/apier_detail_cubit.dart';
import 'package:real_estate/logic/cubit/invite_earn/invite_earn_cubit.dart';
import 'package:real_estate/logic/repository/apier_repository.dart';

import 'logic/bloc/verify_otp/verify_otp_bloc.dart';
import 'logic/cubit/maps/google_maps_cubit.dart';
import 'state_inject_package_names.dart';

class StateInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProviders = <RepositoryProvider>[
    ///network client
    RepositoryProvider<Client>(
      create: (context) => Client(),
    ),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),

    ///data source repository
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImp(
        client: context.read(),
      ),
    ),

    RepositoryProvider<LocalDataSource>(
      create: (context) => LocalDataSourceImpl(
        sharedPreferences: context.read(),
      ),
    ),
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImp(
        remoteDataSource: context.read(),
        localDataSource: context.read(),
      ),
    ),

    RepositoryProvider<AppSettingRepository>(
      create: (context) => AppSettingRepositoryImp(
        remoteDataSource: context.read(),
        localDataSource: context.read(),
      ),
    ),

    RepositoryProvider<ProfileRepository>(
      create: (context) => ProfileRepositoryImp(
        remoteDataSource: context.read(),
        localDataSource: context.read(),
      ),
    ),
    RepositoryProvider<HomeRepository>(
      create: (context) => HomeRepositoryImp(
        remoteDataSource: context.read(),
        localDataSource: context.read(),
      ),
    ),
    RepositoryProvider<PropertyRepository>(
        create: (context) => PropertyRepositoryImp(
              remoteDataSource: context.read(),
              localDataSource: context.read(),
            )),
    RepositoryProvider<AgentRepository>(
      create: (context) => AgentRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),
    RepositoryProvider<PrivacyPolicyRepository>(
      create: (context) => PrivacyPolicyRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),
    RepositoryProvider<ReviewRepository>(
      create: (context) => ReviewRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<WishListRepository>(
      create: (context) => WishListRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<ContactUsRepository>(
      create: (context) => ContactUsRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<OrderRepository>(
      create: (context) => OrderRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<PaymentRepository>(
      create: (context) => PaymentRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<SearchRepository>(
      create: (context) => SearchRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<FilterPropertyRepository>(
      create: (context) => FilterPropertyRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<PaymentOnlineRepository>(
      create: (context) => PaymentOnlineRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),

    RepositoryProvider<ApierRepository>(
      create: (context) => ApierRepositoryImp(
        remoteDataSource: context.read(),
      ),
    ),
    RepositoryProvider<SettingRepository>(
      create: (context) => SettingRepositoryImpl(
        remoteDataSource: context.read(),
      ),
    ),
  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(
        profileRepository: context.read(),
        authRepository: context.read(),
      ),
    ),
    BlocProvider<OtpCubit>(
      create: (BuildContext context) => OtpCubit(
        otpRepository: context.read(),
      ),
    ),
    BlocProvider<VerifyOtpCubit>(
      create: (BuildContext context) => VerifyOtpCubit(
        otpRepository: context.read(),
      ),
    ),
    BlocProvider<SignUpBloc>(
      create: (BuildContext context) => SignUpBloc(
        // profileRepository: context.read(),
        context.read(),
      ),
    ),
    BlocProvider<VerifyForgotPasswordBloc>(
      create: (BuildContext context) => VerifyForgotPasswordBloc(
        context.read(),
      ),
    ),
    BlocProvider<VerifyOtpBloc>(
      create: (BuildContext context) => VerifyOtpBloc(
        context.read(),
      ),
    ),
    BlocProvider<AppSettingCubit>(
      create: (BuildContext context) => AppSettingCubit(
        context.read(),
      ),
    ),
    BlocProvider<ChangePasswordCubit>(
      create: (BuildContext context) => ChangePasswordCubit(
        profileRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<ForgotPasswordCubit>(
      create: (BuildContext context) => ForgotPasswordCubit(
        context.read(),
      ),
    ),
    BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(
        context.read(),
      ),
    ),
    BlocProvider<PropertyDetailsCubit>(
      create: (BuildContext context) => PropertyDetailsCubit(
        context.read(),
      ),
    ),
    BlocProvider<CreateInfoCubit>(
      create: (BuildContext context) => CreateInfoCubit(
        repository: context.read(),
        loginBloc: context.read(),
        remoteDataSource: context.read(),
      ),
    ),
    BlocProvider<ProfileCubit>(
      create: (BuildContext context) => ProfileCubit(
        profileRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<AgentCubit>(
      create: (BuildContext context) => AgentCubit(
        agentRepository: context.read(),
      ),
    ),
    BlocProvider<PrivacyPolicyCubit>(
      create: (BuildContext context) => PrivacyPolicyCubit(
        repository: context.read(),
      ),
    ),
    BlocProvider<ReviewCubit>(
      create: (BuildContext context) => ReviewCubit(
        reviewRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<WishlistCubit>(
      create: (BuildContext context) => WishlistCubit(
        wishListRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<ContactUsCubit>(
      create: (BuildContext context) => ContactUsCubit(
        contactUsRepository: context.read(),
      ),
    ),
    BlocProvider<AboutUsCubit>(
      create: (BuildContext context) => AboutUsCubit(
        contactUsRepository: context.read(),
      ),
    ),
    BlocProvider<OrderCubit>(
      create: (BuildContext context) => OrderCubit(
        orderRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<PricePlanCubit>(
      create: (BuildContext context) => PricePlanCubit(
        paymentRepository: context.read(),
      ),
    ),
    BlocProvider<PaymentCubit>(
      create: (BuildContext context) => PaymentCubit(
        paymentRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<BankPaymentCubit>(
      create: (BuildContext context) => BankPaymentCubit(
        paymentRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<StripePaymentCubit>(
      create: (BuildContext context) => StripePaymentCubit(
        paymentRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<FlutterWavePaymentCubit>(
      create: (BuildContext context) => FlutterWavePaymentCubit(
        paymentRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<SearchBloc>(
      create: (BuildContext context) => SearchBloc(
        searchRepository: context.read(),
      ),
    ),
    BlocProvider<PropertyCreateBloc>(
      create: (BuildContext context) => PropertyCreateBloc(
        context.read(),
        context.read(),
      ),
    ),
    BlocProvider<UpdateCubit>(
      create: (BuildContext context) => UpdateCubit(
        context.read(),
        context.read(),
      ),
    ),
    BlocProvider<FilterPropertyCubit>(
      create: (BuildContext context) => FilterPropertyCubit(
        filterPropertyRepository: context.read(),
      ),
    ),
    BlocProvider<GoogleMapsCubit>(
      create: (BuildContext context) => GoogleMapsCubit(),
    ),
    BlocProvider<SubscriptionProductCubit>(
      create: (BuildContext context) => SubscriptionProductCubit(
        paymentOnlineRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<SubmitPaymentLinkCubit>(
      create: (BuildContext context) => SubmitPaymentLinkCubit(
        paymentOnlineRepository: context.read(),
        loginBloc: context.read(),
      ),
    ),
    BlocProvider<ApierCubit>(
      create: (BuildContext context) =>
          ApierCubit(repository: context.read(), loginBloc: context.read()),
    ),
    BlocProvider<ApierDetailCubit>(
      create: (BuildContext context) => ApierDetailCubit(
          repository: context.read(), loginBloc: context.read()),
    ),
    BlocProvider<InviteEarnCubit>(
      create: (BuildContext context) => InviteEarnCubit(),
    ),
    BlocProvider<SettingCubit>(
      create: (BuildContext context) =>
          SettingCubit(settingRepository: context.read()),
    ),
  ];
}
