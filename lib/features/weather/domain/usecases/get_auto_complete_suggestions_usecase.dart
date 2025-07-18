import 'package:movies_app/core/utils/app_data_types.dart';

import '../../data/models/suggestions.dart';
import '../repositories/weather_repository.dart';

class GetAutoCompleteSuggestionsUseCase {
  final WeatherRepository repository;

  GetAutoCompleteSuggestionsUseCase(this.repository);

  ListOfDataResponse<Suggestions> call(String? query) async {
    return repository.getAutoCompleteSuggestions(query);
  }
}
