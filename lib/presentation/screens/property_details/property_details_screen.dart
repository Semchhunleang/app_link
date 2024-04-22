import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/utils.dart';
import '/presentation/widget/loading_widget.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../data/model/product/single_property_model.dart';
import 'component/property_details_nav_bar.dart';
import 'component/property_details_view.dart';
import 'component/property_horizontal_view.dart';
import 'component/property_images_slider.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({Key? key, required this.slug}) : super(key: key);
  final String slug;

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final detailsCubit = context.read<PropertyDetailsCubit>();
    detailsCubit.fetchPropertyDetails(widget.slug);
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
        builder: (context, state) {
          if (state is PropertyDetailsLoading) {
            return const LoadingWidget();
          }
          if (state is PropertyDetailsError) {
            if (state.code == 503) {
              return LoadedProperDetails(
                  property: detailsCubit.singleProperty!);
            } else {
              return Center(
                child: Text(state.error),
              );
            }
          }
          if (state is PropertyDetailsLoaded) {
            return LoadedProperDetails(property: state.singlePropertyModel);
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: const PropertyDetailNavBar(),
    );
  }
}

class LoadedProperDetails extends StatelessWidget {
  const LoadedProperDetails({Key? key, required this.property})
      : super(key: key);
  final SinglePropertyModel property;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      children: [
        PropertyImagesSlider(property: property),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 1.0.sh * 0.06).copyWith(bottom: size.height * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextStyle(
                text: property.propertyItemModel!.title,
                color: blackColor,
                fontWeight: FontWeight.w700,
                height: 1.6,
                maxLine: 2,
                overflow: TextOverflow.ellipsis,
                fontSize: profileNameFontSize,
              ),
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomImage(
                      width: propertyCardIconSize,
                      path: KImages.locationIcon),
                  Utils.horizontalSpace(8.0),
                  Expanded(
                    child: CustomTextStyle(
                      text: property.propertyItemModel!.address,
                      color: grayColor,
                      fontWeight: FontWeight.w400,
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        PropertyHorizontalView(property: property),
        const PropertyTextTabView(),
        const SizedBox(height: 0),
      ],
    );
  }
}
