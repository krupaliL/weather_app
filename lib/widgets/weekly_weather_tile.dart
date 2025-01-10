import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/widgets/subscript_text.dart';

import '../constants/app_colors.dart';
import '../constants/text_styles.dart';

class WeeklyWeatherTile extends ConsumerWidget {
  const WeeklyWeatherTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  final String day;
  final String date;
  final int temp;
  final String icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(day, style: TextStyles.h3),
              const SizedBox(height: 5),
              Text(date, style: TextStyles.subtitleText),
            ],
          ),
          SuperscriptText(
            text: temp.toString(),
            superScript: "°C",
            color: AppColors.white,
            superscriptColor: AppColors.grey2,
          ),

          Image.asset(icon, width: 60),
        ],
      ),
    );
  }
}