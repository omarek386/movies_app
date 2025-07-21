import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/features/weather/domain/entities/forecast_entity.dart';
import 'package:movies_app/features/weather/domain/entities/location_entity.dart';
import 'package:movies_app/features/weather/presentation/widgets/ai_widget.dart';

import '../../../../core/constants/images.dart';

import 'forecast_days.dart';
import 'sun_rise_box.dart';
import 'sun_set_box.dart';
import 'title_with_search.dart';
import 'today_status.dart';

// ignore: must_be_immutable
class ShowData extends StatelessWidget {
  ShowData({
    super.key,
    required this.location,
    required this.forecast,
    this.aiPrediction,
  });
  final LocationEntity location;
  final ForecastEntity forecast;
  late String currentTimeCondition;
  late String currentTimeConditionLogo;
  final int? aiPrediction;

  @override
  Widget build(BuildContext context) {
    checkTime();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(currentTimeCondition), fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.h,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const TitleWithSearch(),
              const SizedBox(
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  width: 200.w,
                  // height: 100.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(83, 142, 142, 142),
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                      transform: GradientRotation(0.5),
                      colors: [
                        Color.fromARGB(81, 0, 0, 0),
                        Color.fromARGB(99, 255, 255, 255),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        currentTimeConditionLogo,
                        width: 100.w,
                        height: 100.h,
                      ),
                      Text(
                        location.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      Text(
                        '${forecast.forecastday[0].day.avgtempC}° C',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 38.sp),
                      ),
                      Text(
                        DateFormat('EEEE')
                            .format(DateTime.parse(location.localtime)),
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(location.localtime)),
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ForecastDays(forecast: forecast),
              TodayStatus(forecast: forecast),
              SunRiseBox(forecast: forecast),
              SunSetBox(forecast: forecast),
              aiPrediction != null
                  ? AiWidget(aiPrediction: aiPrediction)
                  : Container(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkTime() {
    // log(DateTime.parse(location.localTime).hour.toString());
    final date = DateTime.parse(location.localtime);
    final String day = DateFormat('EEEE').format(date);
    log(day);
    // log(int.parse(forecast.days[0].astro.sunset.substring(0, 2)).toString());
    // log(int.parse(forecast.days[0].astro.sunrise.substring(0, 2)).toString());
    if (DateTime.parse(location.localtime).hour >
            int.parse(forecast.forecastday[0].astro.sunset.substring(0, 2)) &&
        DateTime.parse(location.localtime).hour <
            int.parse(forecast.forecastday[0].astro.sunrise.substring(0, 2))) {
      currentTimeCondition = Images.sunSetBackground;
      currentTimeConditionLogo = Images.sunset;
    } else if (DateTime.parse(location.localtime).hour <
            int.parse(forecast.forecastday[0].astro.sunset.substring(0, 2)) &&
        DateTime.parse(location.localtime).hour <
            int.parse(forecast.forecastday[0].astro.sunrise.substring(0, 2))) {
      currentTimeCondition = Images.nightBackground;
      currentTimeConditionLogo = Images.nightState;
    } else {
      currentTimeCondition = Images.dayBackground;
      currentTimeConditionLogo = Images.clearState;
    }
  }
}
