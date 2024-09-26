import 'package:flutter/material.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/widgets/trip_item.dart';

import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  const CategoryTripsScreen({super.key, required this.avelibleTrips});
  static const categoryTripsScreen = 'categoryTripsScreen';

  final List<Trip> avelibleTrips;

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late Category category;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final argumentsRoute =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    category = argumentsRoute['category']!;
    displayTrips = widget.avelibleTrips.where((trip) {
      return trip.categories.contains(category.id);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          category.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            trip: displayTrips[index],
          );
        },
      ),
    );
  }
}
