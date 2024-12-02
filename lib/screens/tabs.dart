import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_plan/providers/favorites_provider.dart';
import 'package:meal_plan/providers/filters_provider.dart';
import 'package:meal_plan/screens/categories_screen.dart';
import 'package:meal_plan/screens/filters_screen.dart';
import 'package:meal_plan/screens/meals_screen.dart';
import 'package:meal_plan/widgets/drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;

  void selectDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push(
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

  @override
  Widget build(BuildContext context) {
    late final Widget activeScreen;
    late final String appBarTitle;

    if (selectedPageIndex == 0) {
      activeScreen = CategoriesScreen(
        filteredMeals: ref.watch(filteredMealsProvider)
      );
      appBarTitle = 'Pick a Category';
    } else {
      activeScreen = MealsScreen(
        meals: ref.watch(favoritesProvider),
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
