import 'package:flutter/material.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    void selectCategory() {
      Navigator.of(context).pushNamed(
        CategoryTripsScreen.categoryTripsScreen,
        arguments: {
          'category': category,
        },
      );
    }

    return InkWell(
      onTap: selectCategory,
      splashColor: primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              category.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
