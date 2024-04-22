import 'package:real_estate/data/model/apier/filter_options_model.dart';
import 'package:real_estate/data/model/apier/summary_model.dart';
import 'package:real_estate/logic/cubit/apier/apier_cubit.dart';
import 'package:real_estate/logic/cubit/apier/apier_state_model.dart';
import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/widget/custom_app_bar.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/presentation/widget/datetime_picker.dart';
import 'package:real_estate/presentation/widget/loading_widget.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'widget/widget.dart';

class InvitedEarnBalance extends StatelessWidget {
  InvitedEarnBalance({super.key});
  final String startDate = DateTime.now().toString();
  final String endDate = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    final apierCubit = context.read<ApierCubit>();
    apierCubit.getApierFilterData(startDate, endDate);
    return Scaffold(
        appBar: const CustomAppBar(title: "INVITES & EARN BALANCE"),
        body: BlocBuilder<ApierCubit, ApierStateModel>(
          builder: (context, state) {
            final apier = state.apierState;
            if (apier is ApierLoading) {
              return const LoadingWidget();
            } else if (apier is ApierError) {
              return Center(
                  child: CustomTextStyle(text: apier.message, color: redColor));
            } else {
              return InviteEarnBalanceLoaded(
                summaryData: apierCubit.summaryData!,
                dateFilter: apierCubit.dateFilter!,
              );
            }
          }
        )
    );
  }
}

class InviteEarnBalanceLoaded extends StatelessWidget {
  final SummaryApierModel summaryData;
  final FilterOptionsModel dateFilter;
  const InviteEarnBalanceLoaded(
      {super.key, required this.summaryData, required this.dateFilter});

  @override
  Widget build(BuildContext context) {
    final apierCubit = context.read<ApierCubit>();
    return Scaffold(
      backgroundColor: whiteColor,
      // appBar: AppBar(
      //   backgroundColor: whiteColor,
      //   elevation: 2,
      //   shadowColor: grayColor,
      //   centerTitle: true,
      //   title: const CustomTextStyle(text: 'INVITES & EARN BALANCE'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.published_with_changes_rounded, color: primaryColor, size: iconSize+ 5,),
      //       onPressed: (){
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    margin: EdgeInsets.only(
                        left: paddingHorizontal,
                        right: paddingHorizontal,
                        top: 90.h),
                    child: Row(
                      children: [
                        BigCard(
                            title: "TOTAL INVITES",
                            value: "${summaryData.totalInvite}"),
                        SizedBox(
                          width: 5.w,
                        ),
                        BigCard(
                            title: "TOTAL EARNING",
                            value: "${summaryData.totalAmount}"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border( bottom: BorderSide(width: 3,color: colorSpanishGrey.withOpacity(0.1)))),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      for (int i = 0; i < summaryData.data!.length; i++)
                        LevelListWidget(
                          summaryLevel: summaryData.data![i],
                          onTap: () async {
                            Navigator.pushNamed(context, RouteNames.detailApier,
                                arguments: {
                                  "startDate": dateFmtYMD.format(
                                      DateTime.parse(apierCubit.startDate)),
                                  "endDate": dateFmtYMD.format(
                                      DateTime.parse(apierCubit.endDate)),
                                  "depth":
                                      summaryData.data![i].depth.toString(),
                                  "level": summaryData.data![i].level.toString()
                                });
                          },
                        ),
                    ],
                  ))
                ],
              ),
              Positioned(
                width: 1.sw - 10.w - 60,
                top: 33.h,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: paddingHorizontal + 4, right: paddingHorizontal),
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<ApierCubit, ApierStateModel>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SelectBoxWidget(
                                  onTap: () => apierCubit.onSelectShow(),
                                  showOptions: apierCubit.showOptions,
                                  selectedOption: apierCubit.selectedOption,
                                ),
                                if (apierCubit.showOptions)
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(color: grayColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i < dateFilter.dateFilter!.length;
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              apierCubit.onSelectDateChange("${dateFilter.dateFilter![i].key}", "${dateFilter.dateFilter![i].startDate}", "${dateFilter.dateFilter![i].endDate}");
                                              // setState(() {
                                              //   _selectedOption = "${widget.dateFilter.dateFilter![i].key}";
                                              //   _showOptions = false;
                                              //   startDate = "${widget.dateFilter.dateFilter![i].startDate}";
                                              //   endDate = "${widget.dateFilter.dateFilter![i].endDate}";
                                              // });
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                    // bottom: BorderSide(color: Colors.grey),
                                                    ),
                                              ),
                                              child: Text(
                                                  "${dateFilter.dateFilter![i].key}"),
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CustomTextStyle(
                                                  text: "Start date",
                                                  fontSize: 11,
                                                  color: grayColor,
                                                ),
                                                const SizedBox(height: 5),
                                                SizedBox(
                                                    height: 35,
                                                    width: 130,
                                                    child: DatePicker(
                                                      controller: apierCubit
                                                          .startDateCtrl,
                                                      onChanged:
                                                          (valStartDate) {
                                                        // apierCubit.startDate = valStartDate.toString();
                                                      },
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const CustomTextStyle(
                                                      text: "End date",
                                                      fontSize: 11,
                                                      color: grayColor),
                                                  const SizedBox(height: 5),
                                                  SizedBox(
                                                      height: 35,
                                                      width: 130,
                                                      child: DatePicker(
                                                          controller: apierCubit
                                                              .endDateCtrl,
                                                          onChanged:
                                                              (valEndDate) {
                                                            // apierCubit.endDate =valEndDate.toString();
                                                          }))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: paddingHorizontal,
                top: 30.h,
                child: SearchBTN(
                  onTap: () {
                    context.read<ApierCubit>().getApierFilterData(
                      dateFmtYMD.format(DateTime.parse(apierCubit.startDate)),
                      dateFmtYMD.format(DateTime.parse(apierCubit.endDate)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
