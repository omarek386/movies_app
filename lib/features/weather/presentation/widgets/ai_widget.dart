import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/weather/presentation/widgets/my_container.dart';

class AiWidget extends StatelessWidget {
  const AiWidget({
    super.key,
    required this.aiPrediction,
  });

  final int? aiPrediction;

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
            aiPrediction == 1
                ? Icon(
                    Icons.sunny,
                    size: 64.sp,
                    color: Colors.yellow.shade400,
                  )
                : Icon(
                    Icons.warning,
                    size: 64.sp,
                    color: Colors.red.shade400,
                  ),
            aiPrediction == 1
                ? Text(
                    'It is Good Day To Go Outside',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp),
                  )
                : Text(
                    'It is not a Good Day To Go Outside',
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
