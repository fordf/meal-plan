import 'package:flutter/material.dart';
import 'package:meal_plan/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.categoryTitle, required this.meals});

  final String categoryTitle;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('There are no meals in this category!',
                      style: theme.textTheme.bodyLarge!
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
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.shadow,
                          if (index % 2 == 0)
                            theme.colorScheme.primaryContainer
                          else
                            theme.colorScheme.secondaryContainer,
                          theme.colorScheme.shadow
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          meals[index].imageUrl,
                          height: 60,
                          width: 60,
                        ),
                        const Spacer(),
                        Text(
                          meals[index].title,
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
