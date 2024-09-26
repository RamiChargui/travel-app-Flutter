import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

import '../core/constants.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;

  static const screenRoute = 'filtersScreen';

  FiltersScreen({required this.saveFilters, required this.filters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  @override
  void initState() {
    _isInSummer = widget.filters['summer']!;
    _isInWinter = widget.filters['winter']!;
    _isForFamily = widget.filters['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          'Filters',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': _isInSummer,
                'winter': _isInWinter,
                'family': _isForFamily,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                SwitchListTileItem(
                  'Summer Trips',
                  'Show trips in summer only',
                  _isInSummer,
                  (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  } as Function(bool? p1),
                ),
                SwitchListTileItem(
                  'Winter Trips',
                  'Show trips in winter only',
                  _isInWinter,
                  (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  } as Function(bool? p1),
                ),
                SwitchListTileItem(
                  'Family Trips',
                  'Show trips for Family only',
                  _isForFamily,
                  (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  } as Function(bool? p1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile SwitchListTileItem(String title, String subTitle,
      bool currentValue, Function(bool?) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
