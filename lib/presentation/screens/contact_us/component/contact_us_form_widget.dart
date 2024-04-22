import 'package:real_estate/state_inject_package_names.dart';
import '../../../../logic/cubit/contact_us/contact_us_state_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/error_text.dart';
import '../../../widget/primary_button.dart';

class ContactUsFormWidget extends StatelessWidget {
  const ContactUsFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactUsCubit = context.read<ContactUsCubit>();
    return BlocListener<ContactUsCubit, ContactUsStateModel>(
      listener: (context, state) {
        final contact = state.contactUsState;
        if (contact is ContactUsMessageLoading) {
          Utils.loadingDialog(context);
        } else {
          Utils.closeDialog(context);
          if (contact is ContactUsMessageError) {
            Utils.errorSnackBar(context, contact.message);
          } else if (contact is ContactUsMessageLoad) {
            Navigator.pop(context);
            Utils.showSnackBar(context, contact.message);
            //contactUsCubit.clear();
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: Column(
          children: [
            defaultVerticalSpace,
            BlocBuilder<ContactUsCubit, ContactUsStateModel>(
                builder: (_, state) {
              final s = state.contactUsState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    onChanged: (name) => contactUsCubit.nameChange(name),
                    hintText: 'Name',
                    labelText: "Name",
                    initialValue: state.name,
                  ),
                  // TextFormField(
                  //   decoration: const InputDecoration(
                  //     hintText: 'Name',
                  //   ),
                  //   onChanged: (String name) => contactUsCubit.nameChange(name),
                  //   initialValue: state.name,
                  // ),
                  // if (s is ContactUsMessageFormValidate) ...[
                  //   if (s.errors.name.isNotEmpty)
                  //     ErrorText(text: s.errors.name.first)
                  // ]
                ],
              );
            }),
            defaultVerticalSpace,
            BlocBuilder<ContactUsCubit, ContactUsStateModel>(
                builder: (_, state) {
              final s = state.contactUsState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                      onChanged: (name) => contactUsCubit.emailChange(name),
                      hintText: 'Email',
                      labelText: "Email",
                      initialValue: state.email),
                  if (s is ContactUsMessageFormValidate) ...[
                    if (s.errors.email.isNotEmpty)
                      ErrorText(text: s.errors.email.first)
                  ]
                ],
              );
            }),
            defaultVerticalSpace,
            BlocBuilder<ContactUsCubit, ContactUsStateModel>(
                builder: (_, state) {
              final s = state.contactUsState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    onChanged: (name) => contactUsCubit.subjectChange(name),
                    hintText: 'Subject',
                    labelText: "Subject",
                    initialValue: state.subject,
                  ),
                  // TextFormField(
                  //   decoration: const InputDecoration(
                  //     hintText: 'Subject',
                  //   ),
                  //   onChanged: (String name) =>
                  //       contactUsCubit.subjectChange(name),
                  //   initialValue: state.subject,
                  // ),

                  if (s is ContactUsMessageFormValidate) ...[
                    if (s.errors.subject.isNotEmpty)
                      ErrorText(text: s.errors.subject.first)
                  ]
                ],
              );
            }),
            defaultVerticalSpace,
            BlocBuilder<ContactUsCubit, ContactUsStateModel>(
                builder: (_, state) {
              final s = state.contactUsState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    maxLines: 5,
                    onChanged: (name) => contactUsCubit.subjectChange(name),
                    hintText: 'Message',
                    labelText: "Message",
                    initialValue: state.message,
                  ),
                  if (s is ContactUsMessageFormValidate) ...[
                    if (s.errors.message.isNotEmpty)
                      ErrorText(text: s.errors.message.first)
                  ]
                ],
              );
            }),
            defaultVerticalSpace,
            PrimaryButton(
                text: 'Send Message',
                onPressed: () {
                  Utils.closeKeyBoard(context);
                  contactUsCubit.sendContactUsMessage();
                  //contactUsCubit.clear();
                },
                textColor: blackColor,
                borderRadiusSize: radius,
                bgColor: yellowColor),
          ],
        ),
      ),
    );
  }
}
