import 'package:bd_sales/screen/category_page.dart';
import 'package:bd_sales/screen/home_page.dart';
import 'package:bd_sales/screen/search_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {

  int setIndex=1;
  int selectedIndex=0;

  void onTap(value){
    setState(() {
      selectedIndex=value;
    });
  }
  List<Widget> pageRoute=[
    const HomePage(),
    const CategoryPage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.category,size: 25),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,size: 25),
            label: 'Search',
          ),

        ],
      ),
      body: pageRoute.elementAt(selectedIndex),
    );
  }
}
