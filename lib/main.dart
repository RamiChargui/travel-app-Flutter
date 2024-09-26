// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/screens/category_trips_screen.dart';
import 'package:travel_app/screens/filters_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

import 'models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _avelibleTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avelibleTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && !trip.isInSummer) {
          return false;
        }
        if (_filters['winter'] == true && !trip.isInWinter) {
          return false;
        }
        if (_filters['family'] == true && !trip.isForFamilies) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorites(String tripId) {
    final existIndex = _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existIndex >= 0) {
      setState(() {
        _favoriteTrips.remove(existIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Karla',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: TextStyle(
                color: darkpinkColor,
                fontFamily: 'Karla',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                color: Colors.white,
                fontFamily: 'Karla',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteTrips: _favoriteTrips),
        CategoryTripsScreen.categoryTripsScreen: (context) =>
            CategoryTripsScreen(avelibleTrips: _avelibleTrips),
        TripDetailScreen.screenRoute: (context) => TripDetailScreen(
              manageFavorite: _manageFavorites,
              isFavorite: _isFavorite,
            ),
        FiltersScreen.screenRoute: (context) =>
            FiltersScreen(saveFilters: _changeFilters, filters: _filters),
      },
    );
  }
}
