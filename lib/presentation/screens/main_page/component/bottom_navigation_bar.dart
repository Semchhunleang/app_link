import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import 'main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int statusCode;
  const MyBottomNavigationBar({Key? key, this.statusCode = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();
    final controller = MainController();
    return Container(
      height: Platform.isAndroid ? 75 : 100,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: StreamBuilder(
          initialData: 0,
          stream: controller.naveListener.stream,
          builder: (_, AsyncSnapshot<int> index) {
            int selectedIndex = index.data ?? 0;
            return BottomNavigationBar(
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              selectedLabelStyle:const TextStyle(fontSize: detailFontSize -2, color: blackColor, fontWeight: FontWeight.w500),
              unselectedLabelStyle:const TextStyle(fontSize: detailFontSize -2, color: grayColor, fontWeight: FontWeight.w500),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  icon: _navIcon(KImages.home, height: iconSize),
                  activeIcon: _navIcon(KImages.homeActive, height: iconSize),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  tooltip: "Saved",
                  icon: _navIcon(KImages.saved, height: iconSize),
                  activeIcon: _navIcon(KImages.savedActive, height: iconSize),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  tooltip: 'APIer',
                  icon: _navIcon(KImages.myDeal, height: iconSize),
                  activeIcon: _navIcon(KImages.myDealActive, height: iconSize),
                  label: 'APIer',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Point',
                  icon: _navIcon(KImages.wallet, height: iconSize),
                  activeIcon: _navIcon(KImages.walletActive, height: iconSize),
                  label: 'Point',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Setting',
                  activeIcon: _navIcon(KImages.settingActive, height: iconSize),
                  icon: _navIcon(KImages.setting, height: iconSize),
                  label: 'Setting',
                ),
              ],
              // type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (int index) {
                controller.naveListener.sink.add(index);
                context
                    .read<WishlistCubit>()
                    .getWishListProperties()
                    .then((value) {
                  if (wishlistCubit.statusCode == 401) {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.loginScreen);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _navIcon(String path,{double width = 20.0, double height = 20.0, double vertical = 8.0}) =>
      Padding(
      padding: EdgeInsets.symmetric(vertical: vertical).copyWith(top: 0),
      child: SvgPicture.asset(
        path,
        color: primaryColor,
        height: height,
        width: width,
      ));
}
