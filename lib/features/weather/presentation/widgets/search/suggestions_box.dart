import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/extensions/navigation_extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../cubit/weather_cubit.dart';
import '../../cubit/weather_state.dart';

class SuggestionsBox extends StatelessWidget {
  const SuggestionsBox({
    super.key,
    this.query,
  });
  final String? query;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuggestionsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuggestionsFailure) {
          return Center(
            child: Text(
              'Failed to load suggestions: ${state.message}',
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        } else if (state is WeatherSuggestionsState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.suggestions[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  subtitle: Text(
                      textAlign: TextAlign.end,
                      state.suggestions[index].country,
                      style: TextStyle(fontSize: 14.sp)),
                  onTap: () {
                    context.pushReplacementNamed(
                      Routes.homeScreen,
                      arguments: state.suggestions[index].name,
                    );
                  },
                );
              },
            ),
          );
        }
        return const SizedBox
            .shrink(); // Return an empty widget if no suggestions
      },
    );
  }
}
