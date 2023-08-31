import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(children: [
        buildSwitchTile(
            context,
            'Gluten-free',
            'Only include gluten-free meals',
            activeFilters[Filter.glutenFree]!,
            (isChecked) => _onFilterToggle(ref, Filter.glutenFree, isChecked)),
        buildSwitchTile(
            context,
            'Lactose-free',
            'Only include lactose-free meals',
            activeFilters[Filter.lactoseFree]!,
            (isChecked) => _onFilterToggle(ref, Filter.lactoseFree, isChecked)),
        buildSwitchTile(
            context,
            'Vegetarian',
            'Only include vegetarian meals',
            activeFilters[Filter.vegetarian]!,
            (isChecked) => _onFilterToggle(ref, Filter.vegetarian, isChecked)),
        buildSwitchTile(
            context,
            'Vegan',
            'Only include vegan meals',
            activeFilters[Filter.vegan]!,
            (isChecked) => _onFilterToggle(ref, Filter.vegan, isChecked)),
      ]),
    );
  }

  void _onFilterToggle(WidgetRef ref, Filter filter, bool isChecked) {
    ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
  }

  Widget buildSwitchTile(BuildContext context, String title, String subtitle,
      bool value, Function(bool) onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: (isChecked) {
        onChanged(isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
