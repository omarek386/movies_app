import 'suggestions.dart';

class AutoComplete {
  List<Suggestions> suggestions;

  AutoComplete({required this.suggestions});

  factory AutoComplete.fromJson(List json) {
    return AutoComplete(
      suggestions: json.map((e) => Suggestions.fromJson(e)).toList(),
    );
  }
}
