import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/images.dart';
import 'package:movies_app/features/weather/data/models/subModels/forecast_model.dart';
import 'my_container.dart';

class SunSetBox extends StatelessWidget {
  const SunSetBox({
    super.key,
    required this.forecast,
  });

  final ForecastModel forecast;

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
            Image.asset(Images.sunset),
            Text(
              forecast.forecastday[0].astro.sunset,
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
