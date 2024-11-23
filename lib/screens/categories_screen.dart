import 'package:flutter/material.dart';
import 'package:meal_plan/data/dummy_data.dart';
import 'package:meal_plan/models/category.dart';
import 'package:meal_plan/models/meal.dart';
import 'package:meal_plan/screens/meals_screen.dart';
import 'package:meal_plan/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorited});

  final void Function(Meal meal) onToggleFavorited;

  void _selectCategory(
      {required BuildContext context, required Category category}) {
    final meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          appBarTitle: category.title,
          meals: meals,
          onToggleFavorited: onToggleFavorited,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onTap: () {
              _selectCategory(
                context: context,
                category: category,
              );
            },
          )
      ],
    );
  }
}
