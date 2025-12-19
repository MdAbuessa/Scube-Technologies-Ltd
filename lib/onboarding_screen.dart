 
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
 
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final accountTypeProvider = Provider.of<AccountTypeProvider>(context);
//     return Scaffold(
//         body: Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(AppImages.bg_white),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 21.w),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 UIHelper.verticalSpace(85.h),
//                 Image.asset(
//                   AppImages.peter,
//                   height: 227.h,
//                   width: 206.w,
//                 ),
//                 UIHelper.verticalSpace(114.h),
//                 Text(
//                   "Are You",
//                   style: TextFontStyle.textStyle24OutfitW600
//                       .copyWith(fontSize: 32.sp),
//                 ),
//                 UIHelper.verticalSpace(40.h),
//                 InkWell(
//                   onTap: () {
//                     accountTypeProvider.changeUser("n_user");
//                     NavigationService.navigateTo(Routes.signupScreen);
//                   },
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
//                     decoration: BoxDecoration(
//                       color: AppColor.cFFFFFF,
//                       border: Border.all(color: AppColor.c1F4787),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Booking\nEntertainment, Venues or Both',
//                           style: TextFontStyle.textStyle18OutfitW500,
//                         ),
//                         SvgPicture.asset(
//                           AppIcons.arrow,
//                           height: 24.h,
//                           width: 24.w,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(16.h),
//                 InkWell(
//                   onTap: () {
//                     NavigationService.navigateTo(Routes.identityScreen);
//                   },
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//                     decoration: BoxDecoration(
//                       color: AppColor.cFFFFFF,
//                       border: Border.all(color: AppColor.c1F4787),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'A Entertainer or\nVenue Owner',
//                           style: TextFontStyle.textStyle18OutfitW500,
//                         ),
//                         SvgPicture.asset(
//                           AppIcons.arrow,
//                           colorFilter: ColorFilter.mode(
//                             AppColor.c848585, // Or any other color
//                             BlendMode.srcIn,
//                           ),
//                           height: 24.h,
//                           width: 24.w,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(16.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
