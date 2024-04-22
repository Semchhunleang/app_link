import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';
import 'all_tabs/floor_plans_tab.dart';
import 'all_tabs/location_tab.dart';
import 'all_tabs/property_details_tab.dart';
// import 'all_tabs/property_video_tab.dart';
import 'all_tabs/review_tab.dart';

class PropertyTextTabView extends StatefulWidget {
  const PropertyTextTabView({Key? key}) : super(key: key);

  @override
  State<PropertyTextTabView> createState() => _PropertyTextTabViewState();
}

class _PropertyTextTabViewState extends State<PropertyTextTabView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: whiteColor,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: ExpandablePageView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    tabs.length,
                    (index) => GestureDetector(
                      onTap: () => setState(() => currentIndex = index),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: borderColor))),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 14.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: currentIndex == index
                                    ? primaryColor : transparent,
                              ),
                            ),
                          ),
                          child: CustomTextStyle(
                            text: tabs[index],
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w500,
                            color: currentIndex == index ? blackColor : grayColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: pages[currentIndex],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<String> tabs = [
  'Property Details',
  'Floor Plans',
  // 'Property Video',
  'Location',
  'Review',
];

List<Widget> pages = const [
  PropertyDetailsTab(),
  FloorPlansTab(),
  // PropertyVideoTab(),
  LocationTab(),
  ReviewTab(),
];
