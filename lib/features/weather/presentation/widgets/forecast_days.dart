import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/features/weather/domain/entities/forecast_entity.dart';
import 'my_container.dart';

class ForecastDays extends StatelessWidget {
  const ForecastDays({
    super.key,
    required this.forecast,
  });

  final ForecastEntity forecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: ListView.builder(
          itemCount: forecast.forecastday.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                children: [
                  Text(
                    DateFormat('EEEE').format(forecast.forecastday[index].date),
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: MyContainer(
                      height: 0,
                      width: 90,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                                'https:${forecast.forecastday[index].day.condition.icon}'),
                            SizedBox(height: 10.h),
                            Text(
                              '${forecast.forecastday[index].day.avgtempC}° C',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
