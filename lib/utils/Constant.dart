import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

List<Map<String, Object>> categories(BuildContext context) => [
  {
    "itemName": AppLocalizations.of(context)!.groceryFresh,
    "itemColor": Color(0xFFD6F0D1),
    "itemImage": "assets/images/grocery.png",
  },
  {
    "itemName": AppLocalizations.of(context)!.electronicsAppliances,
    "itemColor": Color(0xFFE0F7FA),
    "itemImage": "assets/images/electronics.png",
  },
  {
    "itemName": AppLocalizations.of(context)!.homeLifestyle,
    "itemColor": Color(0xFFF0E6D1),
    "itemImage": "assets/images/home-lifestyle.png",
  },
  {
    "itemName": AppLocalizations.of(context)!.offers,
    "itemColor": Color(0xFFcbc0d3),
    "itemImage": "assets/images/ic-offer.svg",
  },
];