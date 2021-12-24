import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/category-item/category_item_bloc.dart';
import 'item_selection.dart';
import 'statistics_number.dart';

class AssetsStatistics extends StatelessWidget {
  const AssetsStatistics({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            BlocProvider(
              create: (context) =>
                  CategoryItemsBloc()..add(LoadCategoryItemEvent()),
              child: SizedBox(
                height: size.height * 0.06,
                child: const ItemSelection(),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const StatisticsNumber(),
          ],
        ),
      ),
    );
  }
}
