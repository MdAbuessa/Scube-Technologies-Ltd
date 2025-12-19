import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scube_app/assets_helper/app_colors.dart';
import 'package:scube_app/assets_helper/app_icons.dart';
import 'package:scube_app/assets_helper/app_images.dart';

class DashboardScmScreen extends StatefulWidget {
  const DashboardScmScreen({super.key});

  @override
  State<DashboardScmScreen> createState() => _DashboardScmScreenState();
}

class _DashboardScmScreenState extends State<DashboardScmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cE5F4FE,
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
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.cFFFFFF,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.cB6B8D0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.noData),
              Text('No data is here, please wait.'),
            ],
          ),
        ),
      ),
    );
  }
}
