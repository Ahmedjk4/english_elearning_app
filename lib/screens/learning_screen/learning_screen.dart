import '../../models/item.dart';
import 'components/learning_screen_body.dart';
import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key, required this.items, required this.categoryName});
  final List<ItemModel> items;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: const Color(0xff192b39),
      ),
      body: LearningScreenBody(items: items),
    );
  }
}
