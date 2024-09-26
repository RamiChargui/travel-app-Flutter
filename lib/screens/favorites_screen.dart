import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';

import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.fivoriteTrips});

  final List<Trip> fivoriteTrips;

  @override
  Widget build(BuildContext context) {
    if (fivoriteTrips.isEmpty) {
      return Center(
        child: Text('you don\'t have any favorite trip'),
      );
    } else {
      return ListView.builder(
        itemCount: fivoriteTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            trip: fivoriteTrips[index],
          );
        },
      );
    }
  }
}
