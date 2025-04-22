import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/utils/color.dart';
import 'package:flutter_task/widgets/item_category.dart';

import '../../utils/Constant.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> topPicksList(BuildContext context) => [
    {
      "pickName": AppLocalizations.of(context)!.fruitsVegetables,
      "pickColor": const Color(0xFFFDF5EC), // Soft peach-beige
      "borderColor": const Color(0xFFE6D8C5), // Darker tone
      "pickImage":
          'https://img.freepik.com/free-psd/vibrant-vegetable-harvest-colorful-collection-fresh-produce_191095-79960.jpg',
    },
    {
      "pickName": AppLocalizations.of(context)!.meatFish,
      "pickColor": const Color(0xFFEAF6FB), // Pale sky blue
      "borderColor": const Color(0xFFC2E2EF), // Darker tone
      "pickImage":
          'https://img.freepik.com/free-photo/raw-chicken-meat-fillet-thigh-wings-legs-with-herbs-spices-lemon-garlic-dark-blue-background-top-view_2831-890.jpg',
    },
    {
      "pickName": AppLocalizations.of(context)!.dairyEggs,
      "pickColor": const Color(0xFFF7F3EB), // Cream white
      "borderColor": const Color(0xFFE0D8C8), // Darker tone
      "pickImage":
          'https://img.freepik.com/free-photo/front-view-white-chicken-eggs-inside-basket-with-towel-dark-surface_140725-103357.jpg',
    },
    {
      "pickName": AppLocalizations.of(context)!.bakery,
      "pickColor": const Color(0xFFFFF3E0), // Light bread-like beige
      "borderColor": const Color(0xFFE6D3B3), // Darker tone
      "pickImage":
          'https://img.freepik.com/free-photo/butter-croissants-places-linen-fabric-straw-baskets_140725-5741.jpg',
    },
    {
      "pickName": AppLocalizations.of(context)!.snacksBeverages,
      "pickColor": const Color(0xFFF3E5F5), // Light lavender
      "borderColor": const Color(0xFFD4B9DB), // Darker tone
      "pickImage":
          'https://img.freepik.com/premium-photo/culinary-concoctions-food-drink_960396-132427.jpg',
    },
    {
      "pickName": AppLocalizations.of(context)!.pantryStaples,
      "pickColor": const Color(0xFFF0F4C3), // Soft yellow-green
      "borderColor": const Color(0xFFD4DDA6), // Darker tone
      "pickImage":
          'https://img.freepik.com/free-photo/mixed-legumes-white-bowls_114579-4652.jpg',
    },
    {
      "pickName": AppLocalizations.of(context)!.frozenFoods,
      "pickColor": const Color(0xFFE1F5FE), // Icy blue
      "borderColor": const Color(0xFFB2DDEE), // Darker tone
      "pickImage":
          'https://img.freepik.com/free-photo/top-view-arrangement-frozen-food_23-2148923173.jpg',
    },
  ];

  List<Map<String, Object>> bestPriceList(BuildContext context) => [
    {
      "itemCategory": AppLocalizations.of(context)!.smartphones,
      "itemColor": const Color(0xFFE6D8C5), // Cool Blue
      "itemImage": "assets/images/img-phone.png",
    },
    {
      "itemCategory": AppLocalizations.of(context)!.headphones,
      "itemColor": const Color(0xFFC2E2EF), // Deep Purple
      "itemImage": "assets/images/img-headphone.png",
    },
    {
      "itemCategory": AppLocalizations.of(context)!.shaversTrimmers,
      "itemColor": const Color(0xFFD4B9DB), // Teal
      "itemImage": "assets/images/img-trimmer.png",
    },
  ];

  final List<String> promoBanners = [
    "assets/images/banner-one.png",
    "assets/images/banner-two.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top bar
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 110,
        backgroundColor: MINT_WHISPER,
        title: Column(
          children: [
            Row(
              children: [
                SvgPicture.network("https://www.luluhypermarket.in/logo.svg",),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.pink),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Edathala", style: TextStyle(fontSize: 13)),
                        Text("Aluva", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.pink,
                      size: 32,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                  ),
                  hintText: AppLocalizations.of(context)!.whatAreYouLookingFor,
                  prefixIcon: Icon(CupertinoIcons.search, color: Colors.pink),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // Categories row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      categories(context).map((category) {
                        return Container(
                          width: 90,
                          height: 160,
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              (category["itemName"] as String) == "Offers"
                                  ? SvgPicture.asset(
                                    width: 100,
                                    height: 110,
                                    "assets/images/ic-offer.svg",
                                  )
                                  : itemCategory(
                                    height: 80,
                                    width: 80,
                                    radius: 28,
                                    imageWidth: 70,
                                    color: category["itemColor"] as Color,
                                    image: category["itemImage"] as String,
                                    title: category["itemName"] as String,
                                  ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 12),

            // Carousel Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    clipBehavior: Clip.antiAlias,
                    height: 170.0,
                    autoPlay: true,
                    viewportFraction: 0.95,
                  ),
                  items:
                      promoBanners
                          .map(
                            (item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),

            SizedBox(height: 12),

            // Info box
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0XFF409A29),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/delivery-boy.png",
                    fit: BoxFit.fill,
                    width: 130,
                    height: 85,
                  ),
                  Spacer(),
                  Text(
                    AppLocalizations.of(context)!.deliverySystemUpdate,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // Top Picks------
            sectionTitle(title: "Top Picks"),
            SizedBox(height: 15),

            // Top Picks Items--------
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    topPicksList(context).map((item) {
                      return _bestPriceBanner(item);
                    }).toList(),
              ),
            ),
            // Top Picks Second Item--------
            Container(
              margin: const EdgeInsets.only(right: 10, top: 40),
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestPriceList(context).length,
                itemBuilder:
                    (context, index) {
                      final bestPriceItem = bestPriceList(context)[index];
                      return Container(
                        width: 130,
                        height: 188,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(30),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: bestPriceItem["itemColor"] as Color,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Up to 30% Off",
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                bestPriceItem["itemCategory"] as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                height: 95,
                                bestPriceItem["itemImage"] as String,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bestPriceBanner(Map<String, Object> map) {
    return Container(
      width: 130,
      height: 188,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.only(left: 15, top: 15),
      decoration: BoxDecoration(
        color: map["pickColor"] as Color,
        border: Border.all(width: 1, color: map["borderColor"] as Color),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(30),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BEST PRICE',
            style: TextStyle(
              fontSize: 8,
              backgroundColor: Colors.white,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            map["pickName"] as String,
            style: TextStyle(
              fontSize: 16,
              height: 1,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: map["pickImage"] as String,
                height: 95,
                width: double.maxFinite,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Icon(Icons.error), // Helps debug
              ),
            ),
          ),
        ],
      ),
    );
  }
}
