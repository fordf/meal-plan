import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_plan/models/meal.dart';

class Filter {
  bool glutenFree;
  bool lactoseFree;
  bool vegetarian;
  bool vegan;

  Filter({
    this.lactoseFree = false,
    this.vegetarian = false,
    this.vegan = false,
    this.glutenFree = false,
  });

  Filter copyWith({
    bool? lactoseFree,
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
  }) {
    return Filter(
      lactoseFree: lactoseFree ?? this.lactoseFree,
      vegetarian: vegetarian ?? this.vegetarian,
      vegan: vegan ?? this.vegan,
      glutenFree: glutenFree ?? this.glutenFree,
    );
  }

  bool passesFilter(Meal meal) {
    if (glutenFree && !meal.isGlutenFree) return false;
    if (lactoseFree && !meal.isLactoseFree) return false;
    if (vegetarian && !meal.isVegetarian) return false;
    if (vegan && !meal.isVegan) return false;
    return true;
  }
}

class FiltersNotifier extends StateNotifier<Filter> {
  FiltersNotifier() : super(Filter());

  void setFilter(Filter newFilter) {
    state = newFilter;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Filter>(
  (ref) => FiltersNotifier(),
);
