import 'dart:ui';

import '../screens/account/account_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/category/category_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/offer/offer_screen.dart';

final bottomNavigationItem = [
  HomeScreen(),
  CategoryScreen(),
  OfferScreen(),
  CartScreen(),
  AccountScreen(),
];

final List<Map<String, Object>> categories = [
  {
    "itemName": 'Grocery & Fresh',
    "itemColor": Color(0xFFD6F0D1),
    "itemImage": "assets/images/grocery.png",
  },
  {
    "itemName": 'Electronics & Appliances',
    "itemColor": Color(0xFFE0F7FA),
    "itemImage": "assets/images/electronics.png",
  },
  {
    "itemName": 'Home & Lifestyle',
    "itemColor": Color(0xFFF0E6D1),
    "itemImage": "assets/images/home-lifestyle.png",
  },
  {
    "itemName": 'Offers',
    "itemColor": Color(0xFFcbc0d3),
    "itemImage": "assets/images/ic-offer.svg",
  },
];