import 'package:real_estate/logic/cubit/apier/detail/apier_detail_cubit.dart';
import 'package:real_estate/presentation/screens/invite_and_earn/widget/widget.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/widget/custom_app_bar.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/presentation/widget/loading_widget.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../data/model/apier/detail_apier_byfilter_model.dart';

class DetailApier extends StatelessWidget {
  final String startDate;
  final String endDate;
  final String depth;
  final String level;
  const DetailApier({super.key, required this.startDate, required this.endDate, required this.depth, required this.level});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ApierDetailCubit>();
    cubit.getApierDetailByFilter(startDate, endDate, depth);
    cubit.clearVariables();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: "INVITES LIST-LEVEL $level"),
      body: BlocBuilder<ApierDetailCubit, ApierDetailState>(
        builder: (context, state) {
          if(state is ApierDetailLoading){
            return const LoadingWidget();
          }else if(state is ApierDetailError){
            return Center(child: CustomTextStyle(text: state.error, color: redColor));
          }else{
            return DetailApierWidgetLoaded(detailApier: cubit.detailApier!);
          }
        },
      ),
    );
  }
}

class DetailApierWidgetLoaded extends StatelessWidget {
  final DetailApierByFilterModel detailApier;
  const DetailApierWidgetLoaded({super.key, required this.detailApier});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ApierDetailCubit>();
    return Column(
      children: [
        Container(
          height: 75,
          margin: EdgeInsets.only(left: paddingHorizontal, right: paddingHorizontal, top: 30, bottom: 20),
          child: Row(
            children: [
              BigCard(
                title: "TOTAL INVITES", value: "${detailApier.totalInvite}"
              ),
              SizedBox(
                width: 5.w,
              ),
              BigCard(
                title: "TOTAL EARNING", value: "${detailApier.totalAmountFormat}"
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,//detailApier.data!.length,
            itemBuilder: (BuildContext context, int index){
              // return ApierListDetailWidget(
              //   onTap: (){

              //   },
              // );
              if(index < detailApier.data!.length){
                return ApierListDetailWidget(onTap: (){},);
              }else{
                return SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Center(
                    child: cubit.hasMore ? const SizedBox(
                    width: 25,
                    height: 25,
                    child:  CircularProgressIndicator(color: primaryColor)):const CustomTextStyle(text: "No more Property to load", color: grayColor,))
                );
              }
            }
          )
        )
      ],
    );
  }
}

class ApierListDetailWidget extends StatelessWidget {
  final Function onTap;
  const ApierListDetailWidget({super.key, required this.onTap});
  final double fontSized = 12;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
            bottom: BorderSide(width: 3, color: colorSpanishGrey.withOpacity(0.1))
          )
        ),
        
        height: 100,
        child: Row(
          children: [
            SizedBox(
              width: 90,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextStyle(
                    textAlign: TextAlign.center,
                    text: "Name:  Va Chouhong",
                    fontSize: fontSized,
                    fontWeight: FontWeight.w400,
                    color: colorSpanishGrey,
                    height: 1.8,
                  ),
                  CustomTextStyle(
                    textAlign: TextAlign.center,
                    text: "Phone:  085677782",
                    fontSize: fontSized,
                    fontWeight: FontWeight.w400,
                    color: colorSpanishGrey,
                  ),
                   CustomTextStyle(
                    textAlign: TextAlign.center,
                    text: "Level:  1",
                    fontSize: fontSized,
                    fontWeight: FontWeight.w400,
                    color: colorSpanishGrey,
                  ),
                  CustomTextStyle(
                    textAlign: TextAlign.center,
                    text: "Date:  2024-04-11",
                    fontSize: fontSized,
                    fontWeight: FontWeight.w400,
                    color: colorSpanishGrey,
                  ),
                ],
              )
              ),
            const Expanded(
              child: CustomTextStyle(
              textAlign: TextAlign.center,
              text: "\$200.00",
              fontSize: titleFontSize + 5,
              fontWeight: FontWeight.w500,
              color: colorSpanishGrey,
            ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Icons.arrow_forward_ios_rounded, size: iconSize, weight: 0.01, color: colorSpanishGrey.withOpacity(0.7),),
            )
          ],
        ),
      ),
    );
  }
}