part of 'wishlist_cubit.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistInitial extends WishlistState {
  const WishlistInitial();
}

class WishListLoading extends WishlistState {}

class AddToWishlistLoading extends WishlistState {}

class RemoveFromWishlistLoading extends WishlistState {}

class WishListLoaded extends WishlistState {
  final WishListModel wishlist;

  const WishListLoaded(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}

class AddToWishlistLoad extends WishlistState {
  final String message;

  const AddToWishlistLoad(this.message);

  @override
  List<Object> get props => [message];
}

class RemoveFromWishlistLoad extends WishlistState {
  final String message;

  const RemoveFromWishlistLoad(this.message);

  @override
  List<Object> get props => [message];
}

class WishListError extends WishlistState {
  final String message;
  final int statusCode;

  const WishListError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
