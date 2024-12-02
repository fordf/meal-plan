import 'package:flutter/material.dart';

import 'package:meal_plan/data/dummy_data.dart';
import 'package:meal_plan/models/category.dart';
import 'package:meal_plan/models/meal.dart';
import 'package:meal_plan/screens/meals_screen.dart';
import 'package:meal_plan/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.filteredMeals});

  final List<Meal> filteredMeals;

  @override
  State<StatefulWidget> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _selectCategory({
    required BuildContext context,
    required Category category,
  }) {
    final meals = widget.filteredMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          appBarTitle: category.title,
          meals: meals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
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
      ),
      // builder: (ctx, child) => Padding(
      //   padding: EdgeInsets.only(top: (1 - animationController.value) * 100),
      //   child: child,
      // ),
      builder: (ctx, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.decelerate,
          ),
        ),
        child: child,
      ),
    );
  }
}
