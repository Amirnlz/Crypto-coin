part of 'category_item_bloc.dart';

@immutable
abstract class CategoryItemEvent {}

class ChangeCategoryItemEvent extends CategoryItemEvent {
  final CategoryType selectedItem;

  ChangeCategoryItemEvent({required this.selectedItem});
}

class LoadCategoryItemEvent extends CategoryItemEvent {}
