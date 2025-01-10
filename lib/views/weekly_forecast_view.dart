import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extensions/datetime.dart';
import 'package:weather_app/providers/weekly_weather_provider.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

import '../widgets/weekly_weather_tile.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);

    return weeklyForecastData.when(
      data: (weeklyWeather) {
        return ListView.builder(
          itemCount: weeklyWeather.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek =
                DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;
            final date = weeklyWeather.daily.time[index];
            final temp = weeklyWeather.daily.temperature2mMax[index];
            final icon = weeklyWeather.daily.weatherCode[index];

            return WeeklyWeatherTile(
              date: date,
              day: dayOfWeek,
              temp: temp.toInt(),
              // icon: 'assets/icons/${weeklyWeather.weather[0].icon.replaceAll('n', 'd')}.png',
              icon: getWeatherIcon2(icon),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}