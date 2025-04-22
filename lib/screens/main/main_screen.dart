import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/LocaleProvider.dart';
import '../../utils/Constant.dart';
import '../cart/cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void showLanguageChangeDialog(BuildContext ctx) {
    final localeProvider = Provider.of<LocaleProvider>(ctx, listen: false);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Switch Language"),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(onPressed: () {
                localeProvider.setLocale(Locale("en"));
                Navigator.of(context).pop();
              }, child: Text("English")),
              TextButton(onPressed: () {
                localeProvider.setLocale(Locale("ar"));
                Navigator.of(context).pop();
              }, child: Text("Arabic")),
            ],
          ),
    );
  }

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
          } else if (value == 2) {
            print("hello");
            showLanguageChangeDialog(context);
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
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            label: AppLocalizations.of(context)!.category,
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
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.shopping_cart),
            label: AppLocalizations.of(context)!.myCart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person),
            label: AppLocalizations.of(context)!.account,
          ),
        ],
      ),
    );
  }
}
