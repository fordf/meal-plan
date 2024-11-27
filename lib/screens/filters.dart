import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_plan/providers/filters_provider.dart';
import 'package:meal_plan/widgets/switch_tile.dart';


class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {

  late Filter filter;

  @override
  void initState() {
    super.initState();
    filter = ref.read(filtersProvider).copyWith();
  }

  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          ref.read(filtersProvider.notifier).setFilter(filter);
          // Navigator.of(context).pop(filter);
        },
        child: Column(
          children: [
            SwitchTile(
              title: 'Gluten-free',
              onChanged: (switchOn) {
                setState(() {
                  filter.glutenFree = switchOn;
                });
              },
              value: filter.glutenFree,
            ),
            SwitchTile(
              title: 'Lactose-free',
              onChanged: (switchOn) {
                setState(() {
                  filter.lactoseFree = switchOn;
                });
              },
              value: filter.lactoseFree,
            ),
            SwitchTile(
              title: 'Vegetarian',
              onChanged: (switchOn) {
                setState(() {
                  filter.vegetarian = switchOn;
                });
              },
              value: filter.vegetarian,
            ),
            SwitchTile(
              title: 'Vegan',
              onChanged: (switchOn) {
                setState(() {
                  filter.vegan = switchOn;
                });
              },
              value: filter.vegan,
            ),
          ],
        ),
      ),
    );
  }
}
