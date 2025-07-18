// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/extensions/navigation_extensions.dart';
import 'package:movies_app/core/extensions/sizedbox_extensions.dart';
import '../../../../core/routing/routes.dart';
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
        } else if (state is WeatherPermissionRequired) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state.permission.isDeniedForever ||
                          state.permission.isServiceDisabled
                      ? Icons.location_off
                      : Icons.location_on,
                  size: 64.sp,
                  color: Colors.orange.shade400,
                ),
                verticalSpace(16),
                Text(
                  state.permission.isDeniedForever
                      ? 'Location Access Required'
                      : state.permission.isServiceDisabled
                          ? 'Location Services Disabled'
                          : 'Permission Needed',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(8),
                Text(
                  state.permission.message,
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24),
                _buildPermissionActionButtons(context, state),
              ],
            ),
          );
        } else if (state is WeatherFailure) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getErrorIcon(state.statusCode),
                  size: 64.sp,
                  color: Colors.red.shade400,
                ),
                verticalSpace(16),
                Text(
                  'Oops! Something went wrong',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(8),
                Text(
                  state.message,
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24),
                _buildErrorActionButtons(context, state),
              ],
            ),
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSignOutState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.pushNamed(Routes.authHomeScreen);
          });
          return const Center(
            child: Text('Signing out...'),
          );
        } else {
          return const Center(
            child: Text('No data found'),
          );
        }
      },
    ));
  }

  IconData _getErrorIcon(int? statusCode) {
    switch (statusCode) {
      case 505:
        return Icons.location_off;
      case 506:
        return Icons.location_disabled;
      case 507:
        return Icons.settings;
      default:
        return Icons.error_outline;
    }
  }

  Widget _buildErrorActionButtons(BuildContext context, WeatherFailure state) {
    final statusCode = state.statusCode;

    if (statusCode == 505) {
      // Permission denied - show both retry and settings buttons
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<WeatherCubit>().requestLocationPermission();
              },
              icon: const Icon(Icons.location_on),
              label: const Text('Request Location Permission'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          verticalSpace(8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                context.read<WeatherCubit>().openAppSettings();
              },
              icon: const Icon(Icons.settings),
              label: const Text('Open Settings'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
        ],
      );
    } else if (statusCode == 506) {
      // Location services disabled
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<WeatherCubit>().openAppSettings();
          },
          icon: const Icon(Icons.settings),
          label: const Text('Open Location Settings'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
        ),
      );
    } else {
      // General error - show retry button
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<WeatherCubit>().fetchWeatherForecast(location);
          },
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
        ),
      );
    }
  }

  Widget _buildPermissionActionButtons(
      BuildContext context, WeatherPermissionRequired state) {
    final permission = state.permission;

    if (permission.isDeniedForever || permission.isServiceDisabled) {
      // Show settings button for permanently denied or service disabled
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<WeatherCubit>().openAppSettings();
              },
              icon: const Icon(Icons.settings),
              label: Text(permission.isServiceDisabled
                  ? 'Open Location Settings'
                  : 'Open App Settings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          verticalSpace(8),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                context.read<WeatherCubit>().requestLocationPermission();
              },
              child: const Text('Check Again'),
            ),
          ),
        ],
      );
    } else {
      // Show request permission button
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<WeatherCubit>().requestLocationPermission();
              },
              icon: const Icon(Icons.location_on),
              label: const Text('Grant Location Permission'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          verticalSpace(8),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // Allow user to continue without location (manual input)
                context.read<WeatherCubit>().fetchWeatherForecast(null);
              },
              child: const Text('Continue Without Location'),
            ),
          ),
        ],
      );
    }
  }
}
