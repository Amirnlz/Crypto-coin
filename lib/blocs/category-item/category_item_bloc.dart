import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../constant/constans.dart';

part 'category_item_event.dart';
part 'category_item_state.dart';

class CategoryItemsBloc extends Bloc<CategoryItemEvent, CategoryItemState> {
  CategoryItemsBloc() : super(const CategoryItemInitial()) {
    on<CategoryItemEvent>((event, emit) {
      print(event);
      if (event is LoadCategoryItemEvent) {
        emit(ChangedCategoryItemState(state.items));
      } else if (event is ChangeCategoryItemEvent) {
        Map<CategoryType, bool> items = {...state.items};
        items.updateAll(
            (key, value) => key == event.selectedItem ? true : false);

        emit(ChangedCategoryItemState(items));
      }
    });
  }
}
