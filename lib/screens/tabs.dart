import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_plan/models/meal.dart';
import 'package:meal_plan/providers/meals_provider.dart';

import 'package:meal_plan/screens/categories_screen.dart';
import 'package:meal_plan/screens/filters.dart';
import 'package:meal_plan/screens/meals_screen.dart';
import 'package:meal_plan/widgets/drawer.dart';

class Filter {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegetarian = false;
  bool vegan = false;

  bool passesFilter(Meal meal) {
    if (glutenFree && !meal.isGlutenFree) return false;
    if (lactoseFree && !meal.isLactoseFree) return false;
    if (vegetarian && !meal.isVegetarian) return false;
    if (vegan && !meal.isVegan) return false;
    return true;
  }
}

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];
  Filter filter = Filter();

  void selectDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final filterResult = await Navigator.of(context).push<Filter>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(filter: filter),
        ),
      );
      setState(() {});
    }
  }

  void selectPage(index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void toggleMealFavorited(Meal meal) {
    final index = favoriteMeals.indexOf(meal);
    setState(() {
      if (index == -1) {
        favoriteMeals.add(meal);
      } else {
        favoriteMeals.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    late final Widget activeScreen;
    late final String appBarTitle;

    if (selectedPageIndex == 0) {
      activeScreen = CategoriesScreen(
        onToggleFavorited: toggleMealFavorited,
        filteredMeals: meals.where(filter.passesFilter).toList(),
      );
      appBarTitle = 'Pick a Category';
    } else {
      activeScreen = MealsScreen(
        meals: favoriteMeals,
        onToggleFavorited: toggleMealFavorited,
      );
      appBarTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: activeScreen,
      drawer: MealyDrawer(
        onSelectDrawerTile: selectDrawerScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        onTap: (index) {
          selectPage(index);
        },
      ),
    );
  }
}
