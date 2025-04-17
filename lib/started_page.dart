import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/utils/color.dart';

class StartedPage extends StatelessWidget {
  StartedPage({super.key});

  final imageUrls = [
    "https://img.freepik.com/premium-photo/laptop-shopping-cart-white-background_488220-30970.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-psd/shopping-cart-smartphone-online-shopping-mobile-commerce-red-bags_632498-41857.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-psd/pink-phone-online-shopping-cart-bags-sale_632498-53378.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/premium-photo/shopping-cart-laptop-white-background_1048944-13706819.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-photo/cyber-monday-shopping-sales_23-2148688499.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-vector/online-shopping-concept-landing-page_52683-20156.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/premium-photo/laptop-shopping-cart-white-background_488220-30970.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-psd/shopping-cart-smartphone-online-shopping-mobile-commerce-red-bags_632498-41857.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-psd/pink-phone-online-shopping-cart-bags-sale_632498-53378.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/premium-photo/shopping-cart-laptop-white-background_1048944-13706819.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-photo/cyber-monday-shopping-sales_23-2148688499.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
    "https://img.freepik.com/free-vector/online-shopping-concept-landing-page_52683-20156.jpg?ga=GA1.1.1847722780.1738571535&semt=ais_hybrid&w=740",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Revolutionize Your Shopping Experience',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Shop Groceries, Electronics, Apparels, Home Appliances and Food - All in One App',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Add navigation logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Get started →',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
