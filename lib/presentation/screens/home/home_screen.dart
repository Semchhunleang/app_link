import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/utils.dart';
import '/presentation/widget/loading_widget.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../data/model/home/home_data_model.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../router/route_names.dart';
import 'component/fun_fact_section.dart';
import 'component/home_app_bar.dart';
import 'component/horizontal_category_view.dart';
import 'component/horizontal_property_view.dart';
import 'component/property_agents_view.dart';
import 'component/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      //appBar: const HomeAppBar(),
      body: BlocListener<ProfileCubit, ProfileStateModel>(
        listener: (context, state) {
          final profile = state.profileState;
          if (profile is ProfileUpdateLoaded) {
            Utils.showSnackBar(context, profile.message);
            context.read<ProfileCubit>().getAgentProfile();
            context.read<ProfileCubit>().getUserProfile();
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const LoadingWidget();
            }
            if (state is HomeErrorState) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is HomeDataLoaded) {
              return LoadedWidget(homeDataModel: state.homeDataLoaded);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class LoadedWidget extends StatefulWidget {
  const LoadedWidget({
    super.key,
    required this.homeDataModel,
  });

  final HomeDataModel homeDataModel;

  @override
  State<LoadedWidget> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<LoadedWidget> {
  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getUserProfile();
    context.read<ProfileCubit>().getAgentProfile();

    final appSetting = context.read<AppSettingCubit>().settingModel!.setting;
    final profileImage = context.read<ProfileCubit>();
    // .usersModel != null
    //     ? context.read<ProfileCubit>().usersModel!.image
    //     : "";
    // final image = profileImage == "" ? appSetting.defaultAvatar : profileImage;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Utils.verticalSpace(homeScreenSpaceVertical),
        BlocBuilder<ProfileCubit, ProfileStateModel>(
          builder: (context, state) {
            final profileState = state.profileState;
            if (profileState is AgentProfileLoaded) {
              return HomeAppBar(
                  image: profileState.usersMore != null
                      ? profileState.usersMore!.image != ""
                          ? profileState.usersMore!.image
                          : appSetting.defaultAvatar
                      : appSetting.defaultAvatar,
                  logo: appSetting.logo);
            }
            return HomeAppBar(
                image: profileImage.usersModel != null
                    ? profileImage.usersModel!.image != ""
                        ? profileImage.usersModel!.image
                        : appSetting.defaultAvatar
                    : appSetting.defaultAvatar,
                logo: appSetting.logo);
          },
        ),
        Utils.verticalSpace(homeScreenSpace),
        const SearchField(),
        Utils.verticalSpace(homeScreenSpace),
        HorizontalCategoryView(category: widget.homeDataModel.category),
        Utils.verticalSpace(homeScreenSpace),
        if (widget.homeDataModel.urgentProperty != null) ...[
          HorizontalPropertyView(
              onTap: () =>
                  Navigator.pushNamed(context, RouteNames.urgentPropertyScreen),
              headingText: widget.homeDataModel.urgentProperty!.title,
              featuredProperty: widget.homeDataModel.urgentProperty!),
        ],
        Utils.verticalSpace(homeScreenSpace),
        PropertyAgentView(agentsModel: widget.homeDataModel.agent),
        Utils.verticalSpace(homeScreenSpace),
        HorizontalPropertyView(
            onTap: () =>
                Navigator.pushNamed(context, RouteNames.allPropertyScreen),
            headingText: widget.homeDataModel.featuredProperty!.description,
            featuredProperty: widget.homeDataModel.featuredProperty!),
        Utils.verticalSpace(homeScreenSpace),
        if (widget.homeDataModel.counter.visibility)
          FunFactSection(counter: widget.homeDataModel.counter),
        if (widget.homeDataModel.counter.visibility)
          Utils.verticalSpace(homeScreenSpaceVertical),
        // const RecommendedProperties(),
        // const SizedBox(height: 20.0),
      ],
    );
  }
}
