import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/product/single_property_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class PropertyHorizontalView extends StatelessWidget {
  const PropertyHorizontalView({Key? key, required this.property})
      : super(key: key);
  final SinglePropertyModel property;

  @override
  Widget build(BuildContext context) {
    final item = property.propertyItemModel!;
    String calculation(dynamic val) => val.toString();
    final List<Map<String, String>> properties = [
      {
        "icon": KImages.propertiesIcon01,
        "title": "Area",
        "size": calculation(item.totalArea.toString())
      },
      {
        "icon": KImages.propertiesIcon02,
        "title": "Unit",
        "size": calculation(item.totalUnit),
      },
      {
        "icon": KImages.propertiesIcon03,
        "title": "Bedrooms",
        "size": calculation(item.totalBedroom)
      },
      {
        "icon": KImages.propertiesIcon02,
        "title": "Bathroom",
        "size": calculation(item.totalBathroom)
      },
      {
        "icon": KImages.propertiesIcon03,
        "title": "Garage",
        "size": calculation(item.totalGarage),
      },
      {
        "icon": KImages.propertiesIcon01,
        "title": "Kitchen",
        "size": calculation(item.totalKitchen),
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          properties.length,
          (index) => Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 15.w : 0.0,
                right: index == properties.length - 1 ? 10.w : 0.0),
            child: Container(
              height: 160,
              width: 140,
              // color: Colors.red,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  color: const Color.fromRGBO(20, 0, 255, 0.06),
                ),
                borderRadius: borderRadius,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(bottom: 6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor.withOpacity(0.1),
                    ),
                    child: CustomImage(
                      path: properties[index]['icon']!,
                      height: 35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomTextStyle(
                    text: properties[index]['title']!,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                  const SizedBox(height: 4.0),
                  CustomTextStyle(
                    text: properties[index]['size']!,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
