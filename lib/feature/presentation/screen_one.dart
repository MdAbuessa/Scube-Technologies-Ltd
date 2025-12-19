import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scube_app/assets_helper/app_colors.dart';
import 'package:scube_app/assets_helper/app_icons.dart';
import 'package:scube_app/feature/widgets/circle_chart.dart';
import 'package:scube_app/feature/widgets/container_widgets.dart';
import 'package:scube_app/feature/widgets/revinue_view_widgets.dart';
import 'package:scube_app/helpers/ui_helpers.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  bool isDataView = true;
  bool isTodayData = true; // true = Today Data, false = Custom Date Data

  // Controllers for date inputs
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _dataRevenueToggle(),
            // Conditional display of EnergyChartCard(s)
            if (isDataView && isTodayData) ...[
              SizedBox(height: 20.h),
              CircleChart(value: 0.7, mainText: "55.00", subText: "kWh/Sqft"),
              SizedBox(height: 16.h),
              _dateTypeToggle(),
              SizedBox(height: 12.h),
              _dateInputs(),
              UIHelper.verticalSpace(20.h),
              EnergyChartCard(
                title: "Energy Chart",
                totalKw: "20.05 kw",
                items: [
                  EnergyDataItem(
                    label: "Data A",
                    data: "2798.50 (29.53%)",
                    cost: "35689 ৳",
                    color: Colors.blue,
                  ),
                  EnergyDataItem(
                    label: "Data B",
                    data: "72598.50 (35.39%)",
                    cost: "5259689 ৳",
                    color: Colors.lightBlue,
                  ),
                  EnergyDataItem(
                    label: "Data C",
                    data: "6598.36 (83.90%)",
                    cost: "5698756 ৳",
                    color: Colors.purple,
                  ),
                  EnergyDataItem(
                    label: "Data D",
                    data: "6598.26 (36.59%)",
                    cost: "356987 ৳",
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
            if (isDataView && !isTodayData) ...[
              SizedBox(height: 20.h),
              CircleChart(value: 0.7, mainText: "55.00", subText: "kWh/Sqft"),
              SizedBox(height: 16.h),
              _dateTypeToggle(),
              SizedBox(height: 12.h),
              _dateInputs(),
              UIHelper.verticalSpace(20.h),

              EnergyChartCard(
                title: "Energy Chart 1",
                totalKw: "20.05 kw",
                items: [
                  EnergyDataItem(
                    label: "Data A",
                    data: "2798.50 (29.53%)",
                    cost: "35689 ৳",
                    color: Colors.blue,
                  ),
                  EnergyDataItem(
                    label: "Data B",
                    data: "72598.50 (35.39%)",
                    cost: "5259689 ৳",
                    color: Colors.lightBlue,
                  ),
                  EnergyDataItem(
                    label: "Data C",
                    data: "6598.36 (83.90%)",
                    cost: "5698756 ৳",
                    color: Colors.purple,
                  ),
                  EnergyDataItem(
                    label: "Data D",
                    data: "6598.26 (36.59%)",
                    cost: "356987 ৳",
                    color: Colors.orange,
                  ),
                ],
              ),
              UIHelper.verticalSpace(20.h),
              EnergyChartCard(
                title: "Energy Chart 2",
                totalKw: "5.53 kw",
                items: [
                  EnergyDataItem(
                    label: "Data A",
                    data: "2798.50 (29.53%)",
                    cost: "35689 ৳",
                    color: Colors.blue,
                  ),
                  EnergyDataItem(
                    label: "Data B",
                    data: "72598.50 (35.39%)",
                    cost: "5259689 ৳",
                    color: Colors.lightBlue,
                  ),
                  EnergyDataItem(
                    label: "Data C",
                    data: "6598.36 (83.90%)",
                    cost: "5698756 ৳",
                    color: Colors.purple,
                  ),
                  EnergyDataItem(
                    label: "Data D",
                    data: "6598.26 (36.59%)",
                    cost: "356987 ৳",
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
            if (isDataView == false) ...[
              SizedBox(height: 20.h),
              CircleChart(value: 0.7, mainText: "8897455", subText: "tk"),
              UIHelper.verticalSpace(30.h),
              DataCostExpandableCard(),
            ],
          ],
        ),
      ),
    );
  }

  /// Data View / Revenue View
  Widget _dataRevenueToggle() {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          _radioButton("Data View", isDataView, () {
            setState(() => isDataView = true);
          }),
          _radioButton("Revenue View", !isDataView, () {
            setState(() => isDataView = false);
          }),
        ],
      ),
    );
  }

  Widget _radioButton(String text, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected ? Colors.blue : Colors.grey,
                size: 16,
              ),
              SizedBox(width: 6.w),
              Text(
                text,
                style: TextStyle(
                  color: selected ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///  Today / Custom Date
  Widget _dateTypeToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => setState(() => isTodayData = true),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: isTodayData ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 6),
              Text(
                "Today Data",
                style: TextStyle(
                  color: isTodayData ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () => setState(() => isTodayData = false),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: !isTodayData ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 6),
              Text(
                "Custom Date Data",
                style: TextStyle(
                  color: !isTodayData ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Date Inputs
  Widget _dateInputs() {
    return Row(
      children: [
        _dateBox(_fromDateController, "From Date"),
        SizedBox(width: 8.w),
        _dateBox(_toDateController, "To Date"),
        SizedBox(width: 8.w),
        Container(
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
            color: AppColor.c0096FC.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10.r),
            border: BoxBorder.all(color: AppColor.c0096FC),
          ),
          child: Icon(Icons.search, color: AppColor.c0096FC),
        ),
      ],
    );
  }

  Widget _dateBox(TextEditingController controller, String hint) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            String formattedDate =
                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
            setState(() {
              controller.text = formattedDate;
            });
          }
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: const Icon(
            Icons.calendar_today,
            size: 16,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
