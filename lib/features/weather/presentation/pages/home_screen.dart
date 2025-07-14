import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';
import '../widgets/show_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.location});
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          log('Initial State');
          context.read<WeatherCubit>().fetchWeatherForecast(location);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          return ShowData(
            location: state.location,
            forecast: state.forecast.forecast,
          );
        } else if (state is WeatherFailure) {
          return Center(
            child: Text('Failed to load data ${state.message}',
                style: const TextStyle(fontSize: 20, color: Colors.red)),
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('No data found'),
          );
        }
      },
    ));
  }
}
