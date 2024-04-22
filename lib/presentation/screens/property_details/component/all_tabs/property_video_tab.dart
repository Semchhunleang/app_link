import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PropertyVideoTab extends StatefulWidget {
  const PropertyVideoTab({Key? key}) : super(key: key);

  @override
  State<PropertyVideoTab> createState() => _PropertyVideoTabState();
}

class _PropertyVideoTabState extends State<PropertyVideoTab> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }

  String getVideoId(String id) {
    return "https://www.youtube.com/embed/$id";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final item = state.singlePropertyModel.propertyItemModel;
          return Column(
            children: [
              MyReadMoreText(text: item!.videoDescription, trimLines: 4, trimLength: 180),
              SizedBox(height: 12.h),
              SizedBox(
                height: 230.h,
                width: 350.w,
                child: WebViewWidget(
                  controller: controller
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..enableZoom(true)
                    ..loadRequest(Uri.parse(getVideoId(item!.videoId))),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
