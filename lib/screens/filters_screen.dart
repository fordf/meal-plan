import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_plan/providers/filters_provider.dart';
import 'package:meal_plan/widgets/switch_tile.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
          children: [
            SwitchTile(
              title: 'Gluten-free',
              onChanged: (switchOn) {
                ref.read(filtersProvider.notifier).setFilter(glutenFree: switchOn);
              },
              value: filter.glutenFree,
            ),
            SwitchTile(
              title: 'Lactose-free',
              onChanged: (switchOn) {
                ref.read(filtersProvider.notifier).setFilter(lactoseFree: switchOn);;
              },
              value: filter.lactoseFree,
            ),
            SwitchTile(
              title: 'Vegetarian',
              onChanged: (switchOn) {
                ref.read(filtersProvider.notifier).setFilter(vegetarian: switchOn);
              },
              value: filter.vegetarian,
            ),
            SwitchTile(
              title: 'Vegan',
              onChanged: (switchOn) {
                ref.read(filtersProvider.notifier).setFilter(vegan: switchOn);
              },
              value: filter.vegan,
            ),
          ],
        ),
    );
  }
}
