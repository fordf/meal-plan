import 'package:flutter/material.dart';

import 'package:meal_plan/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key, required this.meal, required this.onToggleFavorited});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorited;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorited(meal);
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredients',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final ingredient in meal.ingredients)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      ingredient,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'Recipe',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < meal.steps.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 30,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${i + 1}. ',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onPrimaryContainer),
                        ),
                        Expanded(
                          child: Text(
                            meal.steps[i],
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
