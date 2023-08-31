import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMelasNotifier extends StateNotifier<List<Meal>> {
  FavoriteMelasNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isMealFavorite = state.contains(meal);
    if (isMealFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMelasProvider =
    StateNotifierProvider<FavoriteMelasNotifier, List<Meal>>((ref) {
  return FavoriteMelasNotifier();
});
