import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/presentation/widget/loading_widget.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/model/auth/user_profile_model.dart';
import '../../../../logic/cubit/agent/agent_state_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/contact_button.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/error_text.dart';
import '../../../widget/primary_button.dart';

class AgentInformation extends StatelessWidget {
  const AgentInformation({Key? key, required this.agent}) : super(key: key);
  final UserProfileModel agent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final defaultImage =
        context.read<AppSettingCubit>().settingModel!.setting.defaultAvatar;

    return SizedBox(
      height: size.height * 0.35,
      width: size.width,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            child: const CustomImage(
              path: KImages.profileBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 25.h,
            left: 10.w,
            child: Row(
              children: [
                const BtnCycleBack(isBackGroundWhite: true),
                SizedBox(width: 10.w),
                const CustomTextStyle(
                  text: 'Agent Profile',
                  fontWeight: FontWeight.w500,
                  fontSize: titleFontSize,
                  color: whiteColor,
                )
              ],
            ),
          ),
          Positioned.fill(
              top: size.height / 12.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: ClipOval(
                      child: CustomImage(
                        path: agent.image != "" ? agent.image : defaultImage,
                        height: size.height * 0.16,
                        width: size.height * 0.16,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextStyle(
                    text: agent.name,
                    fontSize: profileNameFontSize,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  CustomTextStyle(
                    text: agent.designation,
                    fontSize: detailFontSize,
                    fontWeight: FontWeight.w400,
                    color: whiteColor,
                  ),
                ],
              )),
          Positioned(
            bottom: -14.h,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContactButton(
                  onPressed: () => Navigator.pushNamed(
                      context, RouteNames.sendMessageScreen,
                      arguments: agent.email),
                  bgColor: yellowColor,
                  text: 'Message',
                  icon: KImages.messageIcon,
                  iconTextColor: blackColor,
                ),
                ContactButton(
                  onPressed: () async {
                    Uri uri = Uri(scheme: 'tel', path: agent.phone);
                    //print(uri.runtimeType);
                    if (agent.phone.isNotEmpty) {
                      launchUrl(uri);
                    } else {
                      Utils.showSnackBar(context, 'Phone number is Empty');
                    }
                  },
                  bgColor: blackColor,
                  text: 'Call',
                  icon: KImages.callIcon,
                  iconTextColor: whiteColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SendMessageDialog extends StatelessWidget {
  const SendMessageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final agentCubit = context.read<AgentCubit>();
    const spacer = SizedBox(height: 12.0);
    return Dialog(
      child: ListView(
        // mainAxisSize: MainAxisSize.min,

        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomImage(path: KImages.cancelIcon))
            ],
          ),
          const SizedBox(height: 14.0),
          BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
            final s = state.agentState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  onChanged: (String name) => agentCubit.nameChange(name),
                  initialValue: state.name,
                ),
                // if (s is AgentSendMessageFormValidate) ...[
                //   if (s.errors.name.isNotEmpty)
                //     ErrorText(text: s.errors.name.first)
                // ]
              ],
            );
          }),
          spacer,
          BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
            final s = state.agentState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  onChanged: (String name) => agentCubit.emailChange(name),
                  initialValue: state.email,
                ),
                if (s is AgentSendMessageFormValidate) ...[
                  if (s.errors.email.isNotEmpty)
                    ErrorText(text: s.errors.email.first)
                ]
              ],
            );
          }),
          spacer,
          BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
            final s = state.agentState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Agent Email',
                  ),
                  onChanged: (String name) => agentCubit.agentEmailChange(name),
                  initialValue: state.agentEmail,
                ),
                if (s is AgentSendMessageFormValidate) ...[
                  if (s.errors.agentEmail.isNotEmpty)
                    ErrorText(text: s.errors.agentEmail.first)
                ]
              ],
            );
          }),
          spacer,
          BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
            final s = state.agentState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Subject',
                  ),
                  onChanged: (String name) => agentCubit.subjectChange(name),
                  initialValue: state.subject,
                ),
                if (s is AgentSendMessageFormValidate) ...[
                  if (s.errors.subject.isNotEmpty)
                    ErrorText(text: s.errors.subject.first)
                ]
              ],
            );
          }),
          spacer,
          BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
            final s = state.agentState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Message',
                  ),
                  onChanged: (String name) => agentCubit.messageChange(name),
                  initialValue: state.message,
                ),
                if (s is AgentSendMessageFormValidate) ...[
                  if (s.errors.message.isNotEmpty)
                    ErrorText(text: s.errors.message.first)
                ]
              ],
            );
          }),
          const SizedBox(height: 20.0),
          BlocBuilder<AgentCubit, AgentStateModel>(
            builder: (context, state) {
              final s = state.agentState;
              if (s is AgentSendMessageLoading) {
                return const LoadingWidget();
              }
              return PrimaryButton(
                  text: 'Send Message',
                  onPressed: () {
                    Utils.closeKeyBoard(context);
                    agentCubit.sendMessageToAgent();
                  },
                  textColor: blackColor,
                  fontSize: titleFontSize,
                  borderRadiusSize: radius,
                  bgColor: yellowColor);
            },
          )
        ],
      ),
    );
  }
}
