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

  void setFilter({
    bool? lactoseFree,
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
  }) {
    state = Filter(
      lactoseFree: lactoseFree ?? state.lactoseFree,
      vegetarian: vegetarian ?? state.vegetarian,
      vegan: vegan ?? state.vegan,
      glutenFree: glutenFree ?? state.glutenFree,
    );
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Filter>(
  (ref) => FiltersNotifier(),
);
