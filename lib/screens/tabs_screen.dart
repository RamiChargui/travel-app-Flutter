import 'package:flutter/material.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/widgets/app_drawer.dart';

import '../core/constants.dart';
import '../models/trip.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favoriteTrips});

  final List<Trip> favoriteTrips;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Widget> _screens;
  @override
  void initState() {
    _screens = [
      CategoriesScreen(),
      FavoritesScreen(fivoriteTrips: widget.favoriteTrips),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Tourist Guide',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: _screens.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: primaryColor,
        selectedItemColor: darkpinkColor,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedScreenIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
}


//for top tabBar

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: primaryColor,
//           title: const Text(
//             'Tourist guide',
//             style: TextStyle(
//               color: backgroundColor,
//             ),
//           ),
//           bottom: const TabBar(
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white54,
//             indicatorColor: darkpinkColor,
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.dashboard,
//                 ),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ]),
//       ),
//     );
//   }
// }
