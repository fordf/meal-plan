import 'package:flutter/material.dart';

class MealyDrawer extends StatelessWidget {
  const MealyDrawer({super.key, required this.onSelectDrawerTile});

  final void Function(String pageIdentifier) onSelectDrawerTile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Mealy',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 20
              ),
            ),
            onTap: () {
              onSelectDrawerTile('Meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 20
              ),
            ),
            onTap: () {
              onSelectDrawerTile('Filters');
            },
          ),
        ],
      ),
    );
  }
}
