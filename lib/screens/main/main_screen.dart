import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/Constant.dart';
import '../cart/cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationItem[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 3) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => CartScreen()));
          } else {
            _selectedIndex = value;
            setState(() {});
          }
        },
        elevation: 10,
        selectedIconTheme: IconThemeData(color: Colors.pink),
        selectedLabelStyle: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black45,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/ic-home.svg",
              fit: BoxFit.cover,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 80,
              height: 80,
              child: SvgPicture.asset(
                "assets/images/ic-offer.svg",
                fit: BoxFit.cover,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'My Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
