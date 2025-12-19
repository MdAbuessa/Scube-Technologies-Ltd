import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube_app/assets_helper/app_colors.dart';
import 'package:scube_app/assets_helper/app_icons.dart';
import 'package:scube_app/assets_helper/app_images.dart';
import 'package:scube_app/helpers/all_routes.dart';
import 'package:scube_app/helpers/navigation_service.dart';
import 'package:scube_app/helpers/ui_helpers.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedTab = 0;
  bool isSource = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("SCM", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(AppIcons.notification, height: 22),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _topTabs(),
              UIHelper.verticalSpace(16.h),
              _electricityCard(),
              UIHelper.verticalSpace(20.h),
              _bottomGrid(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 TOP TABS
  Widget _topTabs() {
    return Container(
      height: 46.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: ["Summery", "SLD", "Data"].asMap().entries.map((e) {
          final index = e.key;
          final title = e.value;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTab = index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedTab == index
                      ? Colors.blue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: selectedTab == index ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  //  ELECTRICITY CARD
  Widget _electricityCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          const Text(
            "Electricity",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          UIHelper.verticalSpace(10.h),
          Divider(),
          UIHelper.verticalSpace(10.h),

          //  CIRCULAR INDICATOR
          SizedBox(
            height: 140,
            width: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child: CircularProgressIndicator(
                    value: .0,
                    strokeWidth: 18,
                    backgroundColor: AppColor.c0096FC,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Total Power",
                      style: TextStyle(color: AppColor.c191A1F),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "5.53 kw",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          UIHelper.verticalSpace(18.h),

          Container(
            height: 42.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [
                _toggleButton("Source", true),
                _toggleButton("Load", false),
              ],
            ),
          ),

          UIHelper.verticalSpace(18.h),
          SizedBox(
            height: 250,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  dataTile(
                    title: "Data View",
                    color: AppColor.c0096FC,
                    isActive: true,
                    data1: "55505.63",
                    data2: "58805.63",
                    icon: AppImages.solar,
                    onTap: () {
                      NavigationService.navigateTo(Routes.screenOne);
                    },
                  ),
                  dataTile(
                    title: "Data View 2",
                    color: AppColor.cFB902E,
                    isActive: true,
                    data1: "55505.63",
                    data2: "58805.63",
                    icon: AppImages.radio1,
                    onTap: () {
                      NavigationService.navigateTo(Routes.screenOne);
                    },
                  ),
                  dataTile(
                    title: "Data View 3",
                    color: AppColor.c0096FC,
                    isActive: true,
                    data1: "55505.63",
                    data2: "58805.63",
                    icon: AppImages.power1,
                    onTap: () {
                      NavigationService.navigateTo(Routes.screenOne);
                    },
                  ),
                  dataTile(
                    title: "Data View 4",
                    color: AppColor.c0096FC,
                    isActive: false,
                    data1: "55505.63",
                    data2: "58805.63",
                    icon: AppImages.solar,
                    onTap: () {
                      NavigationService.navigateTo(Routes.screenOne);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, bool source) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isSource = source),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSource == source ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSource == source ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget dataTile({
    required String title,
    required bool isActive,
    required String data1,
    required String data2,
    required String icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xffEAF6FF),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.blue.shade100, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SvgPicture.asset(icon, height: 18, width: 18),
            Image.asset(icon),
            UIHelper.horizontalSpace(12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 14.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        isActive ? "(Active)" : "(Inactive)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: isActive ? Colors.blue : Colors.redAccent,
                        ),
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                  Text(
                    "Data 1    : $data1",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                  ),

                  UIHelper.verticalSpace(4.h),

                  Text(
                    "Data 2    : $data2",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                  ),
                ],
              ),
            ),

            Icon(Icons.chevron_right, size: 28.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _bottomGrid() {
    final items = [
      {"title": "Analysis Pro", "icon": "assets/images/analysis.png"},
      {"title": "G. Generator", "icon": "assets/images/generator.png"},
      {"title": "Plant Summary", "icon": "assets/images/charge.png"},
      {"title": "Natural Gas", "icon": "assets/images/fire.png"},
      {"title": "D. Generator", "icon": "assets/images/generator.png"},
      {"title": "Water Process", "icon": "assets/images/faucet.png"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3,
      ),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            NavigationService.navigateTo(Routes.dashboardScmScreen);
          },
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Top Row
                Row(
                  children: [
                    Image.asset(
                      items[index]["icon"]!,
                      height: 24.h,
                      fit: BoxFit.contain,
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Text(
                      items[index]["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                UIHelper.verticalSpace(8.h),

                /// 🔹 Image under Row
              ],
            ),
          ),
        );
      },
    );
  }
}
