import 'package:real_estate/logic/cubit/payment_online/product/subscription_product_state.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../data/model/online_payment/agrument_product_model.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/loading_widget.dart';
import 'component/custom_product_list.dart';

class SubScriptionProductScreen extends StatefulWidget {
  final ArgumentProductModel argumentProductModel;
  const SubScriptionProductScreen(
      {super.key, required this.argumentProductModel});

  @override
  State<SubScriptionProductScreen> createState() =>
      _SubScriptionProductScreenState();
}

class _SubScriptionProductScreenState extends State<SubScriptionProductScreen> {
  bool isNit = true;

  @override
  Widget build(BuildContext context) {
    final subScripProductCubit = context.read<SubscriptionProductCubit>();
    if (isNit) {
      subScripProductCubit.getProduct(widget.argumentProductModel.group);
      isNit = false;
    }
    // debugPrint("------------- get id of listing : ${widget.id}");

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Subscription Product',
      ),
      body: BlocBuilder<SubscriptionProductCubit, SubscriptionProductState>(
          builder: (context, state) {
        if (state is SubscriptionProductLoading) {
          return const LoadingWidget();
        } else if (state is SubscriptionProductLoaded) {
          return CustomProductList(
            productDataList:
                subScripProductCubit.productPayment!.productDataModel,
            argumentProductModel: widget.argumentProductModel,
          );
          // return Text(
          //     "Test : ${subScripProductCubit.productPayment!.productDataModel[0].code}");
        }

        return const Text("Test not success");
      }),
    );
  }
}
