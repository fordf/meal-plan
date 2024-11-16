import 'package:flutter/material.dart';
import 'package:meal_plan/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.network(
              meal.imageUrl,
              height: 80,
              width: 80,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                meal.title,
                softWrap: true,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
