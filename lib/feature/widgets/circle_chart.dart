import 'package:flutter/material.dart';
import 'package:scube_app/assets_helper/app_colors.dart';

class CircleChart extends StatelessWidget {
  final double value; // progress value between 0.0 and 1.0
  final String mainText; // e.g., "55.00"
  final String subText; // e.g., "kWh/Sqft"
  final double size; // size of the circle
  final double strokeWidth; // thickness of the progress indicator
  final Color backgroundColor;
  final Color progressColor;

  const CircleChart({
    super.key,
    required this.value,
    required this.mainText,
    required this.subText,
    this.size = 140,
    this.strokeWidth = 18,
    this.backgroundColor = AppColor.c0096FC,
    this.progressColor = const Color(0xFFB6B8D0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              color: progressColor.withOpacity(0.8),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mainText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(subText, style: const TextStyle(color: AppColor.c191A1F)),
            ],
          ),
        ],
      ),
    );
  }
}
