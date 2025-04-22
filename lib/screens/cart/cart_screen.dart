import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
              semanticLabel: AppLocalizations.of(context)!.back, // For accessibility
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)!.myCart,
          style: const TextStyle(
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
              height: 280,
              semanticLabel: AppLocalizations.of(context)!.emptyCartTitle, // Accessibility
            ),
            Text(
              AppLocalizations.of(context)!.emptyCartTitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center, // Better for RTL languages
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}