import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_plan/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> fields = {
      "categories": meal.categories,
      "ingredients": meal.ingredients,
      "steps": meal.steps,
      "duration": meal.duration,
      "complexity": meal.complexity,
      "affordability": meal.affordability,
      "isGlutenFree": meal.isGlutenFree,
      "isLactoseFree": meal.isLactoseFree,
      "isVegan": meal.isVegan,
      "isVegetarian": meal.isVegetarian,
    };
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30,),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${i + 1}. ', style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onPrimaryContainer),),
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

            // for (final entry in fields.entries)
            //   Text('${entry.key}: ${entry.value.toString()}', style: GoogleFonts.lato(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
