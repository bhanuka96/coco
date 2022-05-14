import 'package:coco/models/categories/categoriesModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../services/search/searchRepository.dart';

final searchServiceProvider = Provider<SearchRepository>((ref) => SearchRepositoryImpl());

final searchCategoryProvider = FutureProvider.autoDispose.family<List<Accessory>?, String>((ref, query) {
  if (query.isEmpty) {
   // ref.read(chooseCategoryProvider.notifier).remove();
    return [];
  }
  final searchService = ref.watch(searchServiceProvider);
  final search = searchService.searchCategory(query);
  return search;
});

final chooseCategoryProvider = StateNotifierProvider<ChooseCategory, List<int>>((ref) {
  return ChooseCategory();
});

class ChooseCategory extends StateNotifier<List<int>> {
  ChooseCategory() : super([]);

  void update(int id) {
    if (state.contains(id)) {
      _decrement(id);
    } else {
      _increment(id);
    }
  }

  void remove() => state = [];

  void _increment(id) => state = List.from(state)..add(id);

  void _decrement(id) => state = List.from(state)..remove(id);
}
