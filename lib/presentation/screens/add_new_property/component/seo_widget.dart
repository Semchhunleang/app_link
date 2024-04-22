// import 'package:real_estate/state_inject_package_names.dart';
// import '/presentation/utils/utils.dart';
// import '../../../widget/form_header_title.dart';

// class SeoWidget extends StatelessWidget {
//   const SeoWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<PropertyCreateBloc>();
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.r),
//           border: Border.all(
//             width: 0.5,
//             color: Colors.black,
//           )),
//       child: Column(
//         children: [
//           const FormHeaderTitle(title: "SEO Information"),
//           Utils.verticalSpace(8.h),
//           Padding(
//             padding: EdgeInsets.all(8.w),
//             child: BlocBuilder<CreateInfoCubit, CreateInfoState>(
//               builder: (context, state) {
//                 return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                         builder: (context, state) {
//                           return CustomTextField(
//                             // initialValue: state.seoTitle,
//                             onChanged: (value) => bloc.add(PropertySeoTitleEvent(seoTitle: value)),
//                             hintText: 'SEO Title',
//                             labelText: 'SEO Title',
//                             keyboardType: TextInputType.text,
//                           );
//                           // TextFormField(
//                           //   initialValue: state.seoTitle,
//                           //   onChanged: (value) => bloc
//                           //       .add(PropertySeoTitleEvent(seoTitle: value)),
//                           //   decoration: const InputDecoration(
//                           //       hintText: 'SEO Title',
//                           //       labelText: 'SEO Title',
//                           //       hintStyle: TextStyle(color: Colors.black38),
//                           //       labelStyle: TextStyle(
//                           //         color: Colors.black38,
//                           //       )),
//                           //   keyboardType: TextInputType.text,
//                           // );
//                         },
//                       ),
//                       Utils.verticalSpace(14.h),
//                       BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                         builder: (context, state) {
//                           return CustomTextField(
//                             // initialValue: state.seoMetaDescription,
//                             onChanged: (value) => bloc.add(PropertySeoMetaDescriptionEvent(seoMetaDescription: value)),
//                             hintText: 'SEO Description',
//                             labelText: 'SEO Description',
//                             keyboardType: TextInputType.text,
//                           );
//                           //  TextFormField(
//                           //   initialValue: state.seoMetaDescription,
//                           //   onChanged: (value) => bloc.add(
//                           //       PropertySeoMetaDescriptionEvent(
//                           //           seoMetaDescription: value)),
//                           //   decoration: const InputDecoration(
//                           //       hintText: 'SEO Description',
//                           //       labelText: 'SEO Description',
//                           //       hintStyle: TextStyle(color: Colors.black38),
//                           //       labelStyle: TextStyle(
//                           //         color: Colors.black38,
//                           //       )),
//                           //   keyboardType: TextInputType.text,
//                           // );
//                         },
//                       ),
//                     ]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
