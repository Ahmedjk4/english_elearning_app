import '../../../utils/lists/categories.dart';
import 'package:flutter/material.dart';

class CategoriesSliverlistBuilder extends StatelessWidget {
  const CategoriesSliverlistBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return Categories.get(context)[index];
      },
      itemCount: Categories.get(context).length,
    );
  }
}
