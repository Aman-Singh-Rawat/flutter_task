import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/screens/home/home_screen.dart';
import 'package:flutter_task/screens/main/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/Constant.dart';
import '../../widgets/item_category.dart';
import '../../widgets/section_title.dart';

void main() {
  runApp(const MaterialApp(home: CategoryScreen()));
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = List.generate(3, (index) => GlobalKey());

  final _selectionItemColor = [
    Color(0xFFD6F0D1),
    Color(0xFFB5D9F4),
    Color(0xFFFFD2EB),
  ];

  List<List<String>> sectionItems(BuildContext context) => [
    [
      // Grocery & Fresh
      AppLocalizations.of(context)!.fruitsVegetables,
      AppLocalizations.of(context)!.meatFishEggs,
      AppLocalizations.of(context)!.frozenFood,
      AppLocalizations.of(context)!.bakeryBreads,
      AppLocalizations.of(context)!.teaCoffeeDrinks,
      AppLocalizations.of(context)!.dairyIceCreams,
      AppLocalizations.of(context)!.babyCareDiapers,
      AppLocalizations.of(context)!.dryFruitsNuts,
      AppLocalizations.of(context)!.biscuitsChocolates,
      AppLocalizations.of(context)!.snacksBeverages,
      AppLocalizations.of(context)!.breakfastInstantFood,
      AppLocalizations.of(context)!.saucesPicklesSpices,
    ],
    [
      // Electronics
      AppLocalizations.of(context)!.mobiles,
      AppLocalizations.of(context)!.laptops,
      AppLocalizations.of(context)!.tablets,
      AppLocalizations.of(context)!.headphones,
      AppLocalizations.of(context)!.mobiles,
      AppLocalizations.of(context)!.laptops,
      AppLocalizations.of(context)!.tablets,
      AppLocalizations.of(context)!.headphones,
      AppLocalizations.of(context)!.mobiles,
      AppLocalizations.of(context)!.laptops,
      AppLocalizations.of(context)!.tablets,
      AppLocalizations.of(context)!.headphones,
    ],
    [
      // Home
      AppLocalizations.of(context)!.furniture,
      AppLocalizations.of(context)!.homeDecor,
      AppLocalizations.of(context)!.kitchen,
      AppLocalizations.of(context)!.furniture,
      AppLocalizations.of(context)!.homeDecor,
      AppLocalizations.of(context)!.kitchen,
      AppLocalizations.of(context)!.furniture,
      AppLocalizations.of(context)!.homeDecor,
      AppLocalizations.of(context)!.kitchen,
    ],
  ];

  int selectedIndex = 0;

  void scrollToSection(int index) {
    setState(() {
      selectedIndex = index;
    });

    final keyContext = sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _categories = categories(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: _selectionItemColor[selectedIndex],
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Icon(CupertinoIcons.back, color: Colors.black),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Icon(CupertinoIcons.search, color: Colors.black),
            ),
          ),
        ],
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: ListView.builder(
              itemCount: _categories.length - 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => scrollToSection(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index
                              ? Colors.white
                              : Colors.transparent,

                      border: Border(
                        left: BorderSide(
                          width: 5,
                          color:
                              selectedIndex == index
                                  ? Colors.pink
                                  : Colors.transparent,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: itemCategory(
                      radius: 20,
                      title: _categories[index]["itemName"] as String,
                      color: _categories[index]["itemColor"] as Color,
                      image: _categories[index]["itemImage"] as String,
                    ),
                  ),
                );
              },
            ),
          ),

          // Right Content Section
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(_categories.length - 1, (sectionIndex) {
                  return Container(
                    key: sectionKeys[sectionIndex],
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(
                          title:
                              _categories[sectionIndex]["itemName"] as String,
                          gradientWidth: 80,
                          sectionTitleSize: 12,
                        ),
                        const SizedBox(height: 10),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 0.68,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 10,
                          children:
                              sectionItems(context)[sectionIndex].map((item) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            _selectionItemColor[sectionIndex],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/img_grocery.png",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        height: 1,
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
