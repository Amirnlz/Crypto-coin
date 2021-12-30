import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/category-item/category_item_bloc.dart';
import '../../../../../constant/constans.dart';

class ItemSelection extends StatelessWidget {
  const ItemSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(seconds: 1),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder(
          builder: (context, state) {
            if (state is ChangedCategoryItemState) {
              return Row(
                children: buildItems(context, state.items),
              );
            }
            return const Text('items not loaded');
          },
          bloc: BlocProvider.of<CategoryItemsBloc>(context),
        ),
      ),
    );
  }

  List<Widget> buildItems(final context, Map<CategoryType, bool> items) {
    List<Widget> list = [];
    items.forEach(
      (key, value) {
        list.add(
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white24,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              onTap: () => BlocProvider.of<CategoryItemsBloc>(context).add(
                ChangeCategoryItemEvent(selectedItem: key),
              ),
              child: itemText(key.name, value),
            ),
          ),
        );
      },
    );
    return list;
  }

  Widget itemText(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.15) : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(
        title.replaceAll('_', ' '),
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFFcfcfce),
          fontSize: 15,
        ),
      ),
    );
  }
}
