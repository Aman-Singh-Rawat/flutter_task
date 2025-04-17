import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF8FB), // Light pink background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Icon(CupertinoIcons.back, color: Colors.black),
          ),
          onPressed: () {
            // Go back
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty-cart.png',
              // Add your image to assets folder and pubspec.yaml
              height: 280,
            ),
            Text(
              'Your cart is currently empty!!!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
