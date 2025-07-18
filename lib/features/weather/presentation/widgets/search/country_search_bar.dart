import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/navigation_extensions.dart';
import 'package:movies_app/core/routing/routes.dart';

import '../../cubit/weather_cubit.dart';

class CountrySearchBar extends StatefulWidget {
  const CountrySearchBar({
    super.key,
  });

  @override
  State<CountrySearchBar> createState() => _CountrySearchBarState();
}

class _CountrySearchBarState extends State<CountrySearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      trailing: [
        IconButton(
            onPressed: () {
              searchController.clear();
              context
                  .read<WeatherCubit>()
                  .fetchAutoCompleteSuggestions(searchController.text);
            },
            icon: const Icon(Icons.clear, color: Colors.black)),
      ],
      hintText: 'Search for a country',
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.search_rounded, color: Colors.black),
      ),
      controller: searchController,
      onChanged: (value) {
        value.isNotEmpty
            ? context.read<WeatherCubit>().fetchAutoCompleteSuggestions(value)
            : context
                .read<WeatherCubit>()
                .fetchAutoCompleteSuggestions(null); // Clear suggestions
      },
      onSubmitted: (value) {
        context.pushReplacementNamed(Routes.homeScreen, arguments: value);
      },
    );
  }
}
