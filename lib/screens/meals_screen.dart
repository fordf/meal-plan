import 'package:flutter/material.dart';
import 'package:meal_plan/models/meal.dart';
import 'package:meal_plan/screens/meal_screen.dart';
import 'package:meal_plan/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.appBarTitle,
      required this.meals,
      required this.onToggleFavorited});

  final String? appBarTitle;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorited;

  void _selectMeal({required BuildContext context, required Meal meal}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          meal: meal,
          onToggleFavorited: onToggleFavorited,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: appBarTitle == null ? null : AppBar(
        title: Text(appBarTitle!),
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
                child: MealItem(
                  meal: meals[index],
                  onTap: () {
                    _selectMeal(context: context, meal: meals[index]);
                  },
                ),
              ),
            ),
    );
  }
}
