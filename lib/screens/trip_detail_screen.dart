import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/trip.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen(
      {super.key, required this.manageFavorite, required this.isFavorite});
  static const screenRoute = 'tripDetailScreen';

  final Function manageFavorite;
  final Function isFavorite;

  @override
  Widget build(BuildContext context) {
    final argumentsRoute =
        ModalRoute.of(context)!.settings.arguments as Map<String, Trip>;
    final trip = argumentsRoute['trip'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        title: Text(
          trip!.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                trip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            selectTitle(context, 'Activities'),
            listViewConatiner(
              ListView.builder(
                itemCount: trip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10,
                    ),
                    child: Text(trip.activities[index]),
                  ),
                ),
              ),
            ),
            selectTitle(context, 'Program'),
            listViewConatiner(
              ListView.builder(
                itemCount: trip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('day ${index + 1}'),
                      ),
                      title: Text(trip.program[index]),
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => manageFavorite(trip.id),
        child: Icon(
          isFavorite(trip.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Widget selectTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget listViewConatiner(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }
}
