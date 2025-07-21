import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/check_location_permission_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/get_ai_predict_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/get_auto_complete_suggestions_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/get_weather_forecast.dart';
import 'package:movies_app/features/weather/domain/usecases/open_app_settings_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/request_location_permission_usecase.dart';
import '../../data/models/weather_forecast_model.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this._getWeatherForecastUseCase,
    this._getAutoCompleteSuggestionsUseCase,
    this._signOutUsecase,
    this._checkLocationPermissionUseCase,
    this._requestLocationPermissionUseCase,
    this._openAppSettingsUseCase,
    this._getAiPredictUsecase,
  ) : super(WeatherInitial());

  final GetWeatherForecastUseCase _getWeatherForecastUseCase;
  final GetAutoCompleteSuggestionsUseCase _getAutoCompleteSuggestionsUseCase;
  final SignOutUsecase _signOutUsecase;
  final CheckLocationPermissionUseCase _checkLocationPermissionUseCase;
  final RequestLocationPermissionUseCase _requestLocationPermissionUseCase;
  final OpenAppSettingsUseCase _openAppSettingsUseCase;
  final GetAiPredictUsecase _getAiPredictUsecase;

  Future<void> fetchWeatherForecast(String? location) async {
    emit(WeatherLoading());
    final response = await _getWeatherForecastUseCase(location);
    response.fold(
      (failure) => emit(WeatherFailure(failure.message, failure.statusCode)),
      (forecast) {
        emit(WeatherSuccess(forecast, forecast.location));
        fetchAiPrediction(forecast);
      },
    );
  }

  Future<void> fetchAiPrediction(WeatherForecastModel weatherForecast) async {
    emit(WeatherLoading());
    final response = await _getAiPredictUsecase(weatherForecast);
    response.fold(
      (failure) => emit(WeatherFailure(failure.message, failure.statusCode)),
      (prediction) => emit(WeatherSuccess(
          weatherForecast, weatherForecast.location, prediction[0])),
    );
  }

  Future<void> fetchAutoCompleteSuggestions(String? query) async {
    emit(WeatherSuggestionsLoading());
    if (query == null || query.isEmpty) {
      emit(WeatherSuggestionsState([])); // Clear suggestions
      return;
    }
    final response = await _getAutoCompleteSuggestionsUseCase(query);
    response.fold(
      (failure) => emit(WeatherSuggestionsFailure(failure.message)),
      (suggestions) => emit(WeatherSuggestionsState(suggestions)),
    );
  }

  Future<void> signOut() async {
    emit(WeatherLoading());
    await _signOutUsecase();
    emit(WeatherSignOutState("User signed out")); // Reset state after sign out
  }

  Future<void> requestLocationPermission() async {
    emit(WeatherLoading());

    final result = await _requestLocationPermissionUseCase();
    result.fold(
      (failure) => emit(WeatherFailure(failure.message, 500)),
      (permission) {
        if (permission.isGranted) {
          // Permission granted, fetch weather with current location
          fetchWeatherForecast(null);
        } else {
          // Permission denied or other issues
          emit(WeatherPermissionRequired(permission));
        }
      },
    );
  }

  Future<void> openAppSettings() async {
    final result = await _openAppSettingsUseCase();
    result.fold(
      (failure) => emit(WeatherFailure(failure.message, 507)),
      (opened) {
        if (!opened) {
          emit(WeatherFailure(
            'Unable to open settings. Please manually enable location permissions in your device settings.',
            507,
          ));
        }
        // If successfully opened, we don't emit a state change
        // The user will come back and we'll check permission again
      },
    );
  }

  Future<void> checkLocationPermissionStatus() async {
    final result = await _checkLocationPermissionUseCase();
    result.fold(
      (failure) {
        // If there's an error checking permissions, just continue normally
        emit(WeatherInitial());
      },
      (permission) {
        if (permission.isGranted) {
          emit(WeatherInitial());
        } else {
          emit(WeatherPermissionRequired(permission));
        }
      },
    );
  }
}
