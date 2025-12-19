import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_app/assets_helper/app_colors.dart';
import 'package:scube_app/helpers/ui_helpers.dart';

class EnergyChartCard extends StatelessWidget {
  final String title;
  final String totalKw;
  final List<EnergyDataItem> items;

  const EnergyChartCard({
    super.key,
    required this.title,
    required this.totalKw,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///  Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              UIHelper.horizontalSpace(20),
              Text(
                totalKw,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.c191A1F,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔹 Data Items
          ...items.map((item) => _dataRow(item)).toList(),
        ],
      ),
    );
  }

  Widget _dataRow(EnergyDataItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          /// Dot
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8.w,
                width: 8.w,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),

              /// Label
              Text(
                item.label,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
            ],
          ),
          UIHelper.horizontalSpace(16.h),

          /// Data + Cost
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _keyValue("Data", item.data),
                _keyValue("Cost", item.cost),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _keyValue(String key, String value) {
    return Row(
      children: [
        SizedBox(
          width: 40.w,
          child: Text(
            "$key",
            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
          ),
        ),
        Text(
          ": $value",
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

/// 🔹 MODEL CLASS
class EnergyDataItem {
  final String label;
  final String data;
  final String cost;
  final Color color;

  EnergyDataItem({
    required this.label,
    required this.data,
    required this.cost,
    required this.color,
  });
}
