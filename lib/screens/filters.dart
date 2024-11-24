import 'package:flutter/material.dart';
import 'package:meal_plan/widgets/switch_tile.dart';
import 'package:meal_plan/screens/tabs.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.filter});

  final Filter filter;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop(widget.filter);
        },
        child: Column(
          children: [
            SwitchTile(
              title: 'Gluten-free',
              onChanged: (switchOn) {
                setState(() {
                  widget.filter.glutenFree = switchOn;
                });
              },
              value: widget.filter.glutenFree,
            ),
            SwitchTile(
              title: 'Lactose-free',
              onChanged: (switchOn) {
                setState(() {
                  widget.filter.lactoseFree = switchOn;
                });
              },
              value: widget.filter.lactoseFree,
            ),
            SwitchTile(
              title: 'Vegetarian',
              onChanged: (switchOn) {
                setState(() {
                  widget.filter.vegetarian = switchOn;
                });
              },
              value: widget.filter.vegetarian,
            ),
            SwitchTile(
              title: 'Vegan',
              onChanged: (switchOn) {
                setState(() {
                  widget.filter.vegan = switchOn;
                });
              },
              value: widget.filter.vegan,
            ),
          ],
        ),
      ),
    );
  }
}
