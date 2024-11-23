import 'package:flutter/material.dart';
import 'package:meal_plan/models/meal.dart';

import 'package:meal_plan/screens/categories_screen.dart';
import 'package:meal_plan/screens/filters.dart';
import 'package:meal_plan/screens/meals_screen.dart';
import 'package:meal_plan/widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];

  void selectDrawerScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
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
    Widget activeScreen = CategoriesScreen(
      onToggleFavorited: toggleMealFavorited,
    );
    String appBarTitle = 'Pick a Category';

    if (selectedPageIndex == 1) {
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
