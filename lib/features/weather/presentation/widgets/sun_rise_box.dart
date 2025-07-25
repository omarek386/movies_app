import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/images.dart';
import 'package:weather_app/features/weather/domain/entities/forecast_entity.dart';
import 'my_container.dart';

class SunRiseBox extends StatelessWidget {
  const SunRiseBox({
    super.key,
    required this.forecast,
  });

  final ForecastEntity forecast;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Images.sunrise),
            Text(
              forecast.forecastday[0].astro.sunrise,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
