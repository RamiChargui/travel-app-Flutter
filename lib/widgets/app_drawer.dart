import 'package:flutter/material.dart';
import 'package:travel_app/core/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 40),
            color: secondaryColor,
            child: Text(
              'Your Tourist guide',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          drawerItem(context, 'Trips', Icons.card_travel, '/'),
          drawerItem(context, 'Filter', Icons.filter_list, 'filtersScreen'),
        ],
      ),
    );
  }

  Widget drawerItem(
      BuildContext context, String title, IconData icon, String url) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: darkpinkColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'karla',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: darkpinkColor,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(url);
      },
    );
  }
}
