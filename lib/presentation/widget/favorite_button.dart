import 'dart:developer';
import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/utils.dart';
import '../../data/model/product/property_item_model.dart';
import '../utils/constraints.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final _className = "FavoriteButton";

  late Set<PropertyItemModel> wishlist;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    wishlist = <PropertyItemModel>{};
    loadWishlist();
  }

  loadWishlist() {
    final item = context.read<WishlistCubit>().wishlist;
    final i =
        item.where((element) => element.id.toString() == widget.id).toSet();
    if (i.isNotEmpty) {
      setState(() {
        isFavorite = true;
        wishlist = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        //final wishlist = state.wishlistState;
        if (state is WishListLoading) {
          log(_className, name: state.toString());
        } else if (state is WishListError) {
          Utils.errorSnackBar(context, state.message);
        } else if (state is AddToWishlistLoad) {
          Utils.showSnackBar(context, state.message);
        } else if (state is RemoveFromWishlistLoad) {
          Utils.showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is WishListLoaded) {
          wishlist = state.wishlist.properties!.data!
              .where((element) => element.id.toString() == widget.id)
              .toSet();
        }
        return GestureDetector(
          onTap: () async {
            if (isFavorite) {
              // if (wishlist.isNotEmpty) {
              //   print('isFavorite $isFavorite');
              //   wishlistCubit.removeFromWishlist(widget.id);
              //   // final r = await context
              //   //     .read<WishlistCubit>()
              //   //     .removeFromWishlist(wishlist.first.id.toString());
              //   // r.fold((failure) {}, (success) {});
              // }
              // print('isFavorite $isFavorite');
              wishlistCubit.removeFromWishlist(widget.id);
            } else {
              // print('removeFromWishlist');
              // print('isFavorite $isFavorite');
              wishlistCubit.addToWishlist(widget.id);
            }
            setState(() => isFavorite = !isFavorite);
          },
          child: CircleAvatar(
            backgroundColor: borderColor,
            minRadius: 14,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: primaryColor, size: iconSize),
              ),
            ),
          ),
        );
      },
    );
  }
}
