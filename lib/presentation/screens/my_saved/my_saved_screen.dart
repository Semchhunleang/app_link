import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../data/model/product/property_item_model.dart';
import '../../router/route_names.dart';
import '../../utils/k_images.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/empty_widget.dart';
import '../../widget/loading_widget.dart';
import '../home/component/single_property_card_view.dart';

class MySavedScreen extends StatelessWidget {
  const MySavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();
    wishlistCubit.getWishListProperties();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: const CustomAppBar(title: 'My Saved Item'),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return const LoadingWidget();
          } else if (state is WishListError) {
            if (state.statusCode == 503) {
              return WishlistLoadedWidget(wishlist: wishlistCubit.wishlist);
            } else {
              return Center(
                child: CustomTextStyle(
                    text: state.message,
                    color: redColor,
                    fontSize: titleFontSize),
              );
            }
          } else if (state is WishListLoaded) {
            return WishlistLoadedWidget(
                wishlist: state.wishlist.properties!.data!);
          }
          return WishlistLoadedWidget(wishlist: wishlistCubit.wishlist);
          // return const Center(
          //     child: CustomTextStyle(text: 'Something went wrong'));
        },
        buildWhen: (previous, current) {
          return previous != current;
        },
      ),
    );
  }
}

class WishlistLoadedWidget extends StatelessWidget {
  const WishlistLoadedWidget({Key? key, required this.wishlist})
      : super(key: key);
  final List<PropertyItemModel> wishlist;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (wishlist.isEmpty) {
      return Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: const EmptyWidget(
          icon: KImages.emptySavedIcon,
          title: 'No Saved Item Found!',
        ),
      );
    } else {
      return ListView.builder(
        itemCount: wishlist.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding:
            EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 0.0)
                .copyWith(bottom: 40.h),
        itemBuilder: (context, index) {
          final item = wishlist[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, RouteNames.propertyDetailsScreen,
                arguments: item.slug),
            child: SinglePropertyCardView(
              property: item,
            ),
          );
        },
      );
    }
  }
}
