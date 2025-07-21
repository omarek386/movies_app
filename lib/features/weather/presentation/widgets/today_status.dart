import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/weather/domain/entities/forecast_entity.dart';
import 'my_container.dart';

class TodayStatus extends StatelessWidget {
  const TodayStatus({
    super.key,
    required this.forecast,
  });

  final ForecastEntity forecast;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Type=cloud-rain-light.png',
            color: Colors.black,
          ),
          Text('${forecast.forecastday[0].day.dailyWillItRain.toString()}%',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp)),
          Image.asset(
            'assets/images/Type=thermometer-simple-light.png',
            color: Colors.black,
          ),
          Text('${forecast.forecastday[0].day.mintempC.toString()}° C',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp)),
          Image.asset(
            'assets/images/Type=sun-dim-light.png',
            color: Colors.black,
          ),
          Text('${forecast.forecastday[0].day.maxtempC.toString()}° C',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp))
        ],
      ),
    );
  }
}
