import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/utils.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/model/agent/agent_profile_model.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../router/route_names.dart';
import '../../widget/loading_widget.dart';
import 'component/person_information.dart';
import 'component/person_single_property.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    profileCubit.getUserProfile();
    profileCubit.getAgentProfile();
    profileCubit.getAgentDashboardInfo();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: MultiBlocListener(
        listeners: [
          BlocListener<ProfileCubit, ProfileStateModel>(
              listener: (context, state) {
            final profile = state.profileState;
            if (profile is ProfileUpdateLoaded) {
              Utils.showSnackBar(context, profile.message);
              //profileCubit.users = context.read<LoginBloc>().userInfo!.user;
              //final newUser = profileCubit.users;
              // profileCubit.getAgentDashboardInfo();
              profileCubit.getAgentProfile();
              profileCubit.getUserProfile();
              profileCubit.getAgentDashboardInfo();
            }
          }),
          BlocListener<UpdateCubit, UpdateState>(
            listener: (context, state) {
              if (state is PropertyDeleteSuccess) {
                profileCubit.getAgentDashboardInfo();
              }
            },
          ),
          BlocListener<PropertyCreateBloc, PropertyCreateModel>(
            listener: (context, state) {
              final updateState = state.state;
              if (updateState is PropertyUpdateSuccess) {
                profileCubit.getAgentDashboardInfo();
              }
            },
          ),
          BlocListener<PropertyCreateBloc, PropertyCreateModel>(
            listener: (context, state) {
              final updateState = state.state;
              if (updateState is PropertyCreateSuccess) {
                profileCubit.getAgentDashboardInfo();
              }
            },
          ),
        ],
        child: BlocBuilder<ProfileCubit, ProfileStateModel>(
          builder: (context, state) {
            final profileState = state.profileState;
            if (profileState is ProfileLoading) {
              return const LoadingWidget();
            } else if (profileState is ProfileError) {
              if (profileState.statusCode == 503) {
                return ProfileLoadedWidget(
                    properties: profileCubit.agentDetailModel!);
              } else {
                return Center(
                    child: CustomTextStyle(
                        text: profileState.message, color: redColor));
              }
            } else if (profileState is ProfileLoaded) {
              return ProfileLoadedWidget(properties: profileState.profile);
            }
            return profileCubit.agentDetailModel != null
                ? ProfileLoadedWidget(
                    properties: profileCubit.agentDetailModel!)
                : const Center(
                    child: Text('Something is wrong'),
                  );
            // return const Center(
            //   child: Text('something is wrong'),
            // );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<ProfileCubit, ProfileStateModel>(
        builder: (context, state) {
          final profileState = state.profileState;
          if (profileState is ProfileLoading) {
            return const SizedBox.shrink();
          } else if (profileState is ProfileError) {
            return const SizedBox.shrink();
          }
          return Container(
            height: 1.sh * 0.1,
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: PrimaryButton(
              text: 'Create New Property',
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteNames.choosePropertyOptionScreen);
              },
              bgColor: yellowColor,
              borderRadiusSize: radius,
              textColor: blackColor,
              fontSize: titleFontSize,
            ),
          );
        },
      ),
    );
  }
}

class ProfileLoadedWidget extends StatelessWidget {
  const ProfileLoadedWidget({Key? key, required this.properties})
      : super(key: key);
  final AgentProfileModel properties;

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        PersonInformation(properties: properties),
        SizedBox(height: 1.sh * 0.07),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: const Row(
            children: [
              CustomTextStyle(
                text: 'My Property List',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ],
          ),
        ),
        if (properties.properties != null) ...[
          PersonSingleProperty(properties: properties.properties!.data!),
        ],
        SizedBox(height: 1.sh * 0.07),
      ],
    );
  }
}
