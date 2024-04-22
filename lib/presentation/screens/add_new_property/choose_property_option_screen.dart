import 'package:real_estate/logic/cubit/maps/google_maps_cubit.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../data/model/product/property_choose_model.dart';
import '../../router/route_names.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import 'component/single_choose_option.dart';

class ChoosePropertyOptionScreen extends StatelessWidget {
  const ChoosePropertyOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyCubit = context.read<CreateInfoCubit>();
 
    propertyCubit.getPropertyChooseInfo();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Choose Property Option',
      ),
      body: BlocBuilder<CreateInfoCubit, CreateInfoState>(
        builder: (context, state) {
          if (state is CreateInfoLoading) {
            return const LoadingWidget();
          } else if (state is CreateInfoError) {
            if (state.statusCode == 503) {
              return LoadedPropertyChooseInfo(
                  chooseProperty: propertyCubit.chooseProperty!, checkStatusPricing: propertyCubit.checkStatusPricing);
            } else {
              return Center(
                child: CustomTextStyle(
                  text: state.error,
                  color: redColor,
                  fontSize: titleFontSize,
                ),
              );
            }
          } else if (state is PropertyChooseInfoLoaded) {
            return LoadedPropertyChooseInfo(
                chooseProperty: state.chooseProperty, checkStatusPricing: propertyCubit.checkStatusPricing);
          }
          return const Center(
            child: CustomTextStyle(text: 'Something went wrong')
          );
        },
      ),
    );
  }
}

class LoadedPropertyChooseInfo extends StatelessWidget {
  const LoadedPropertyChooseInfo({Key? key, required this.chooseProperty, required this.checkStatusPricing})
      : super(key: key);
  final PropertyChooseModel chooseProperty;
  final String checkStatusPricing;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: spaceBetweenCardAndCard),
      children: [
        SingleChooseOption(
          onTap: () {
            // print(initStatus);
            // if(checkStatusPricing == "true"){
              context.read<PropertyCreateBloc>().add(PropertyStateReset());
              context.read<GoogleMapsCubit>().clearCurrentLatLng();
              Navigator.pushNamed(context, RouteNames.addNewPropertyScreen,
              arguments: 'rent');
            // }else{
            //   alertMsg(context:context, content: 'You don\'t have any pricing plan!');
            // }
          },
          //icon: KImages.rentIcon,
          icon: chooseProperty.rentLogo,
          text: chooseProperty.rentTitle,
          subText: chooseProperty.rentDescription,
          iconBgColor: borderColor,
        ),
        const SizedBox(height: spaceBetweenCardAndCard),
        SingleChooseOption(
          onTap: () {
            // if(checkStatusPricing == "true"){
              context.read<PropertyCreateBloc>().add(PropertyStateReset());
              context.read<GoogleMapsCubit>().clearCurrentLatLng();
              Navigator.pushNamed(context, RouteNames.addNewPropertyScreen,
              arguments: 'sale');
            // }else{
            //   alertMsg(context:context, content: 'You don\'t have any pricing plan!');
            // }
          },
          //icon: KImages.saleIcon,
          icon: chooseProperty.saleLogo,
          text: chooseProperty.saleTitle,
          subText: chooseProperty.saleDescription,
          iconBgColor: yellowColor.withOpacity(0.15),
        ),
      ],
    );
  }
}
