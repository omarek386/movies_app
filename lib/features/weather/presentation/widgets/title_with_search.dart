import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/extensions/navigation_extensions.dart';

import '../../../../core/routing/routes.dart';

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
          'Weather App',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
        IconButton(
          onPressed: () => context.pushNamed(Routes.searchScreen),
          icon: const Icon(Icons.search_sharp, color: Colors.white),
        ),
      ],
    );
  }
}
