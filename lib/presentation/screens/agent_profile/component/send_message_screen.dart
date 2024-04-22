import 'dart:developer';
import 'package:real_estate/state_inject_package_names.dart';
import '/logic/cubit/agent/agent_state_model.dart';
import '/presentation/widget/custom_app_bar.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/error_text.dart';
import '../../../widget/loading_widget.dart';
import '../../../widget/primary_button.dart';

class SendMessageScreen extends StatelessWidget {
  const SendMessageScreen({Key? key, required this.agentEmail})
      : super(key: key);
  final _className = "SendMessageScreen";
  final String agentEmail;

  @override
  Widget build(BuildContext context) {
    final agentCubit = context.read<AgentCubit>();
    final spacer = SizedBox(height: 12.h);
    agentCubit.agentEmailChange(agentEmail);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(title: 'Send Message'),
      body: BlocListener<AgentCubit, AgentStateModel>(
        listener: (_, state) {
          final agent = state.agentState;
          if (agent is AgentSendMessageLoading) {
            log(_className, name: agent.toString());
          } else if (agent is AgentSendMessageError) {
            Utils.errorSnackBar(context, agent.message);
          } else if (agent is AgentSendMessageLoad) {
            Navigator.of(context).pop();
            Utils.showSnackBar(context, agent.message);
          }
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const CustomTextStyle(
            //       text: 'Write Message',
            //       fontWeight: FontWeight.w600,
            //       fontSize: 18.0,
            //       color: blackColor,
            //     ),
            //     GestureDetector(
            //         onTap: () {
            //           Navigator.of(context).pop();
            //           print('cancelll');
            //         },
            //         child: const CustomImage(path: KImages.cancelIcon))
            //   ],
            // ),
            // const SizedBox(height: 14.0),
            BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
              final s = state.agentState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextFormField(
                  //   decoration: const InputDecoration(
                  //     hintText: 'Name',
                  //   ),
                  //   onChanged: (String name) => agentCubit.nameChange(name),
                  //   initialValue: state.name,
                  // ),
                  CustomTextField(
                    initialValue: state.name,
                    onChanged: (name) => agentCubit.nameChange(name),
                    hintText: 'Name',
                    labelText: "Name",
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
                  CustomTextField(
                    initialValue: state.email,
                    onChanged: (email) => agentCubit.emailChange(email),
                    hintText: 'Email',
                    labelText: "Email",
                  ),
                  if (s is AgentSendMessageFormValidate) ...[
                    if (s.errors.email.isNotEmpty)
                      ErrorText(text: s.errors.email.first)
                  ]
                ],
              );
            }),
            // spacer,
            // BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
            //   final s = state.agentState;
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       TextFormField(
            //         decoration: const InputDecoration(
            //           hintText: 'Agent Email',
            //         ),
            //         onChanged: (String name) =>
            //             agentCubit.agentEmailChange(name),
            //         initialValue: state.agentEmail,
            //       ),
            //       if (s is AgentSendMessageFormValidate) ...[
            //         if (s.errors.agentEmail.isNotEmpty)
            //           ErrorText(text: s.errors.agentEmail.first)
            //       ]
            //     ],
            //   );
            // }),
            spacer,
            BlocBuilder<AgentCubit, AgentStateModel>(builder: (_, state) {
              final s = state.agentState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    initialValue: state.subject,
                    onChanged: (String name) => agentCubit.subjectChange(name),
                    hintText: 'Subject',
                    labelText: "Subject",
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
                  CustomTextField(
                    maxLines: 6,
                    initialValue: state.message,
                    onChanged: (String name) => agentCubit.messageChange(name),
                    hintText: 'Message',
                    labelText: "Message",
                  ),
                  if (s is AgentSendMessageFormValidate) ...[
                    if (s.errors.message.isNotEmpty)
                      ErrorText(text: s.errors.message.first)
                  ]
                ],
              );
            }),
            SizedBox(height: 20.h),
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
      ),
    );
  }
}
