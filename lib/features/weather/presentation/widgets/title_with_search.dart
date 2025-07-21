import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/extensions/navigation_extensions.dart';
import 'package:weather_app/core/services/service_locator.dart';

import '../../../../core/constants/cache_keys.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_shared_preferences.dart';
import '../cubit/weather_cubit.dart';

class TitleWithSearch extends StatelessWidget {
  const TitleWithSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hellow ${sl<AppPreferences>().getData(CacheKeys.userKey) ?? 'Guest'}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => context.pushNamed(Routes.searchScreen),
              icon: const Icon(Icons.search_sharp, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                context.read<WeatherCubit>().signOut();
              },
              icon: const Icon(Icons.logout, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
