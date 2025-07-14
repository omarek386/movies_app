import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/get_auto_complete_suggestions_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/get_weather_forecast.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._getWeatherForecastUseCase,
      this._getAutoCompleteSuggestionsUseCase, this._signOutUsecase)
      : super(WeatherInitial());

  final GetWeatherForecastUseCase _getWeatherForecastUseCase;
  final GetAutoCompleteSuggestionsUseCase _getAutoCompleteSuggestionsUseCase;
  final SignOutUsecase _signOutUsecase;

  Future<void> fetchWeatherForecast(String? location) async {
    emit(WeatherLoading());
    final response = await _getWeatherForecastUseCase(location);
    response.fold(
      (failure) => emit(WeatherFailure(failure.message)),
      (forecast) => emit(WeatherSuccess(forecast, forecast.location)),
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
}
