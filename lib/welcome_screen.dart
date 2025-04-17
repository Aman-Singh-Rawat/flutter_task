import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/utils/color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MINT_WHISPER,
      body: Column(
        children: [
          const SizedBox(height: 40),

          // Top Images Grid
          SizedBox(
            height: 300,
            child: GridView.count(
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                imageItem('assets/images/jacket.png'),
                imageItem('assets/images/steak.png'),
                imageItem('assets/images/burger.png'),
                imageItem('assets/images/bag.png'),
                imageItem('assets/images/cake.png'),
                imageItem('assets/images/thali.png'),
                imageItem('assets/images/suitcase.png'),
                imageItem('assets/images/pizza.png'),
                imageItem('assets/images/biryani.png'),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Tagline
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '"Revolutionize Your Shopping Experience"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Lulu Logo
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 60, // or you can reduce this if needed
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/lulu_logo.svg",
              width: 320, // ⬅️ Increase width
              fit: BoxFit.scaleDown, // ⬅️ Makes it fill without overflowing
            ),
          ),



          const SizedBox(height: 10),

          // Subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Shop Groceries, Electronics, Apparels, Home Appliances and Food – All in One App!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),

          const Spacer(),

          // Get Started Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                iconAlignment: IconAlignment.end,
                label: const Text(
                  "Get started",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageItem(String path) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}
