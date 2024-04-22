import 'package:real_estate/presentation/router/route_packages_name.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '/data/model/contact_us/contact_us_model.dart';
import '/presentation/utils/utils.dart';
import '/presentation/widget/custom_app_bar.dart';
import '/presentation/widget/custom_images.dart';
import '../../../logic/cubit/contact_us/contact_us_state_model.dart';
import '../../utils/constraints.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import 'component/contact_us_form_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactUsCubit = context.read<ContactUsCubit>();
    contactUsCubit.getContactUs();
    return Scaffold(
      appBar:
          CustomAppBar(title: contactUsCubit.contactUs!.seoSetting!.pageName),
      body: ListView(
        shrinkWrap: true,
        children: [
          const ContactUsFormWidget(),
          Utils.verticalSpace(27.h),
          BlocBuilder<ContactUsCubit, ContactUsStateModel>(
            builder: (context, state) {
              final contact = state.contactUsState;
              if (contact is ContactUsLoading) {
                return const LoadingWidget();
              } else if (contact is ContactUsError) {
                if (contact.statusCode == 503) {
                  return ContactUsLoadedWidget(
                    contactUs: contactUsCubit.contactUs!);
                } else {
                  return Center(
                    child: CustomTextStyle(
                      text: contact.message,
                      color: redColor,
                      fontSize: titleFontSize,
                    ),
                  );
                }
              } else if (contact is ContactUsLoaded) {
                return ContactUsLoadedWidget(contactUs: contact.contactUs);
              }
              return ContactUsLoadedWidget(
                  contactUs: contactUsCubit.contactUs!);
              // return const Center(
              //     child: CustomTextStyle(text: 'Something went wrong'));
            },
          )
        ],
      ),
    );
  }
}

class ContactUsLoadedWidget extends StatefulWidget {
  const ContactUsLoadedWidget({Key? key, required this.contactUs})
      : super(key: key);
  final ContactUsModel contactUs;

  @override
  State<ContactUsLoadedWidget> createState() => _ContactUsLoadedWidgetState();
}

class _ContactUsLoadedWidgetState extends State<ContactUsLoadedWidget> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: CustomImage(
            path: widget.contactUs.contact!.supporterImage,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              contactInfo(widget.contactUs.contact!.email, Icons.email),
              contactInfo(widget.contactUs.contact!.phone, Icons.phone),
              contactInfo(widget.contactUs.contact!.address, Icons.location_pin),
            ],
          ),
        ),

        Container(
          height: 200.h,
          width: 1.sw,
          margin: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 10.h),
          alignment: Alignment.center,
          child: WebViewWidget(
            controller: controller
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..enableZoom(true)
              //..setBackgroundColor(whiteColor)
              ..loadHtmlString(widget.contactUs.contact!.map),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget contactInfo(String text, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: iconSize),
          SizedBox(width: 10.w),
        Expanded(child: CustomTextStyle(text: text)),
        ],
      ),
    );
  }
}
