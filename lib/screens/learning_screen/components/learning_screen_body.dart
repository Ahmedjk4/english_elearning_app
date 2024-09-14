import 'list_item.dart';
import '../../../models/item.dart';
import 'package:flutter/material.dart';

class LearningScreenBody extends StatelessWidget {
  const LearningScreenBody({super.key, required this.items});
  final List<ItemModel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListItem(
          item: items[index],
          color: const Color(0xff08abbe),
          itemType: 'colors',
        );
      },
    );
  }
}
