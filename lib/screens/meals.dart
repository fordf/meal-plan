import 'package:flutter/material.dart';
import 'package:meal_plan/models/category.dart';
import 'package:meal_plan/models/meal.dart';
import 'package:meal_plan/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.category, required this.meals});

  final Category category;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ope! No meals yet!',
                      style: theme.textTheme.headlineLarge!
                          .copyWith(color: theme.colorScheme.onSurface)),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Add a meal or try a different category',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onSurface))
                ],
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MealItem(meal: meals[index]),
              ),
            ),
    );
  }
}
