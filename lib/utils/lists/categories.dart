import 'package:ealamuni/models/category.dart';
import 'package:ealamuni/utils/app_router.dart';
import 'package:ealamuni/utils/lists/alphabet.dart';
import 'package:ealamuni/utils/lists/emotions.dart';
import 'package:ealamuni/utils/lists/senses.dart';
import 'package:go_router/go_router.dart';
import '../../screens/home_screen/components/category_item.dart';
import '../../models/item.dart';
import 'colors.dart';
import 'family_members.dart';
import 'numbers.dart';
import 'package:flutter/material.dart';

class Categories {
  static const List<CategoryModel> categoryList = [
    CategoryModel(name: 'Numbers', color: Color(0xff92ccaf)),
    CategoryModel(name: 'Family Members', color: Color(0xff558B37)),
    CategoryModel(name: 'Colors', color: Color(0xff08abbe)),
    CategoryModel(name: 'Emotions', color: Color(0xff1bc909)),
    CategoryModel(name: 'Alphabet', color: Color(0xffff0000)),
    CategoryModel(name: 'Senses', color: Color(0xff79359F)),
  ];

  static List<Widget> get(BuildContext context) {
    return categoryList.map((category) {
      return Category(
        onTap: () {
          context.push(AppRouter.learningPath, extra: {
            "items": getItemsForCategory(category.name),
            "categoryName": category.name
          });
        },
        text: category.name,
        color: category.color,
      );
    }).toList();
  }

  
  static List<ItemModel> getItemsForCategory(String categoryName) {
    switch (categoryName) {
      case 'Numbers':
        return numbers; 
      case 'Family Members':
        return familyMembers; 
      case 'Colors':
        return colors; 
      case 'Emotions':
        return emotions; 
      case 'Alphabet':
        return alphabet; 
      case 'Senses':
        return senses; 
      default:
        return []; 
    }
  }
}
