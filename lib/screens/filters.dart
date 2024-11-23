import 'package:flutter/material.dart';
// import 'package:meal_plan/screens/tabs.dart';
// import 'package:meal_plan/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;

  // void onSelectDrawerTile(String identifier) {
  //   Navigator.of(context).pop();
  //   if (identifier == 'Meals') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (ctx) => const TabsScreen())
  //     );
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MealyDrawer(onSelectDrawerTile: onSelectDrawerTile),
      body: Column(
        children: [
          SwitchListTile(
              value: glutenFree,
              onChanged: (switchOn) {
                setState(() {
                  glutenFree = switchOn;
                });
              },
              title: Text(
                'Gluten-free',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              activeColor: theme.colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        ],
      ),
    );
  }
}
