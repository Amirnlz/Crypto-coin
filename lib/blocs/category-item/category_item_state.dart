part of 'category_item_bloc.dart';

@immutable
abstract class CategoryItemState {
  final Map<CategoryType, bool> items;

  const CategoryItemState(this.items);
}

class CategoryItemInitial extends CategoryItemState {
  const CategoryItemInitial(
      {items = const {
        CategoryType.Main_Portfolio: true,
        CategoryType.Experimental: false,
        CategoryType.Top_10_coins: false,
      }})
      : super(items);
}


class ChangedCategoryItemState extends CategoryItemState {
  const ChangedCategoryItemState(Map<CategoryType, bool> items) : super(items);
}
