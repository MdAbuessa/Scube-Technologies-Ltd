import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube_app/assets_helper/app_colors.dart';
import 'package:scube_app/assets_helper/app_icons.dart';
import 'package:scube_app/helpers/ui_helpers.dart';

class DataCostExpandableCard extends StatefulWidget {
  const DataCostExpandableCard({super.key});

  @override
  State<DataCostExpandableCard> createState() => _DataCostExpandableCardState();
}

class _DataCostExpandableCardState extends State<DataCostExpandableCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        children: [
          /// HEADER
          GestureDetector(
            onTap: () {
              setState(() => isExpanded = !isExpanded);
            },
            child: Row(
              children: [
                const Icon(Icons.bar_chart, color: Colors.grey),
                SizedBox(width: 8.w),
                const Expanded(
                  child: Text(
                    "Data & Cost Info",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120),
                      color: AppColor.c0096FC,
                    ),
                    child: Center(child: SvgPicture.asset(AppIcons.arrow)),
                  ),
                ),
              ],
            ),
          ),

          /// EXPAND / COLLAPSE BODY
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(),
            secondChild: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                children: const [
                  _DataRow(label: "Data 1", value: "2798.50 (29.53%)"),
                  _DataRow(label: "Cost 1", value: "35689 ৳"),
                  _DataRow(label: "Data 2", value: "2798.50 (29.53%)"),
                  _DataRow(label: "Cost 2", value: "35689 ৳"),
                  _DataRow(label: "Data 3", value: "2798.50 (29.53%)"),
                  _DataRow(label: "Cost 3", value: "35689 ৳"),
                  _DataRow(label: "Data 4", value: "2798.50 (29.53%)"),
                  _DataRow(label: "Cost 4", value: "35689 ৳"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// SINGLE ROW
class _DataRow extends StatelessWidget {
  final String label;
  final String value;

  const _DataRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          UIHelper.horizontalSpace(10.w),
          Text(": "),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: AppColor.c191A1F,
            ),
          ),
        ],
      ),
    );
  }
}
