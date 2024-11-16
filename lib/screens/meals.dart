import 'package:flutter/material.dart';
import 'package:meal_plan/models/category.dart';
import 'package:meal_plan/models/meal.dart';

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
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          category.color.withOpacity(.6),
                          category.color.withOpacity(.2),
                          // category.color.withOpacity(.5),
                          // theme.colorScheme.shadow,
                          // if (index % 2 == 0)
                          //   theme.colorScheme.primaryContainer
                          // else
                          //   theme.colorScheme.onPrimary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
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
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            meals[index].title,
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
                ),
              ),
            ),
    );
  }
}
